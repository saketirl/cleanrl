# docs and experiment results can be found at https://docs.cleanrl.dev/rl-algorithms/ddpg/#ddpg_continuous_actionpy
import os
import pickle
import random
import sys
import time
from dataclasses import dataclass

import gymnasium as gym
import numpy as np
import torch
import torch.nn as nn
import torch.nn.functional as F
import tyro


def list_and_read_files(directory, suffix, width_str):
    files_with_suffix = []

    # Walk through the directory and find files with the specified suffix
    for root, dirs, files in os.walk(directory):
        for file in files:
            if file.endswith(suffix) and width_str in file:
                filepath = os.path.join(root, file)
                files_with_suffix.append(filepath)

    return files_with_suffix

def gelu_gradient(x):
    phi = torch.exp(-0.5 * x**2) / np.sqrt(2 * np.pi)
    Phi = 0.5 * (1.0 + torch.erf(x / np.sqrt(2.0)))
    return Phi + x * phi

@dataclass
class Args:
    exp_name: str = os.path.basename(__file__)[: -len(".py")]
    """the name of this experiment"""
    seed: int = 1
    """seed of the experiment"""
    torch_deterministic: bool = True
    """if toggled, `torch.backends.cudnn.deterministic=False`"""
    cuda: bool = True
    """if toggled, cuda will be enabled by default"""
    track: bool = False
    """if toggled, this experiment will be tracked with Weights and Biases"""
    wandb_project_name: str = "crate"
    """the wandb's project name"""
    wandb_entity: str = None
    """the entity (team) of wandb's project"""
    capture_video: bool = False
    """whether to capture videos of the agent performances (check out `videos` folder)"""
    save_model: bool = False
    """whether to save model into the `runs/{run_name}` folder"""
    upload_model: bool = False
    """whether to upload the saved model to huggingface"""
    hf_entity: str = ""
    """the user or org name of the model repository from the Hugging Face Hub"""

    # Algorithm specific arguments
    env_id: str = "HalfCheetah-v4"
    """the environment id of the MuJoCo environment"""
    total_timesteps: int = 1000000
    """total timesteps of the experiments"""
    actor_width: int = 256
    """width of the actor network"""
    policy_dir_path: str = None
    """Path to the policy file"""
    states_output_path: str = "data/states_rollouts/"
    """Output path of the states from the rollout"""

def make_env(env_id, seed, idx, capture_video, run_name):
    def thunk():
        if capture_video and idx == 0:
            env = gym.make(env_id, render_mode="rgb_array")
            env = gym.wrappers.RecordVideo(env, f"videos/{run_name}")
        else:
            env = gym.make(env_id)
        env = gym.wrappers.RecordEpisodeStatistics(env)
        env.action_space.seed(seed)
        return env

    return thunk


# ALGO LOGIC: initialize agent here:
class QNetwork(nn.Module):
    def __init__(self, env, width=256):
        super().__init__()
        self.width = width
        self.fc1 = nn.Linear(np.array(env.single_observation_space.shape).prod() + np.prod(env.single_action_space.shape), self.width)
        self.fc2 = nn.Linear(self.width, self.width)
        self.fc3 = nn.Linear(self.width, 1)

    def forward(self, x, a):
        x = torch.cat([x, a], 1)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = self.fc3(x)
        return x


class Actor(nn.Module):
    def __init__(self, env, width=256):
        super().__init__()
        self.width = width
        self.state_dim = np.array(env.single_observation_space.shape).prod()
        self.fc1 = nn.Linear(self.state_dim, self.width, bias=False)
        self.fc_mu = nn.Linear(self.width, np.prod(env.single_action_space.shape), bias=False)
        nn.init.normal_(self.fc1.weight, mean=0.0, std=1 / self.state_dim)
        self.fc1_copy = nn.Linear(self.state_dim, self.width, bias=False)
        self.fc1_copy.load_state_dict(self.fc1.state_dict())
        # action rescaling
        self.register_buffer(
            "action_scale", torch.tensor((env.action_space.high - env.action_space.low) / 2.0, dtype=torch.float32)
        )
        self.register_buffer(
            "action_bias", torch.tensor((env.action_space.high + env.action_space.low) / 2.0, dtype=torch.float32)
        )

    def forward(self, x):
        preactivation_init = self.fc1(x)
        init_intermediate = gelu_gradient(preactivation_init)
        intermediate_linear = self.fc1_copy(x) - preactivation_init
        x = F.gelu(preactivation_init) + torch.mul(intermediate_linear, init_intermediate)
        x = torch.tanh(self.fc_mu(x)/np.sqrt(self.width))
        return x * self.action_scale + self.action_bias


if __name__ == "__main__":
    import stable_baselines3 as sb3

    if sb3.__version__ < "2.0":
        raise ValueError(
            """Ongoing migration: run the following command to install the new dependencies:
poetry run pip install "stable_baselines3==2.0.0a1"
"""
        )
    args = tyro.cli(Args)

    # TRY NOT TO MODIFY: seeding
    random.seed(args.seed)
    np.random.seed(args.seed)
    torch.manual_seed(args.seed)
    torch.backends.cudnn.deterministic = args.torch_deterministic

    device = torch.device("cuda" if torch.cuda.is_available() and args.cuda else "cpu")
    width_str = "width_" + str(args.actor_width) + "_"
    run_name_sanitized = args.env_id + "_" + width_str
    # env setup
    envs = gym.vector.SyncVectorEnv([make_env(args.env_id, args.seed, 0, args.capture_video, run_name_sanitized)])
    assert isinstance(envs.single_action_space, gym.spaces.Box), "only continuous action space is supported"



    files_with_suffix = list_and_read_files(args.policy_dir_path, "0_actor.pkl", width_str)
    all_data = []
    print(len(files_with_suffix))

    for policy_path in files_with_suffix:

        actor = Actor(envs, width=args.actor_width).to(device)

        if os.path.isfile(policy_path):
            actor_state_dict = torch.load(policy_path)
            actor.load_state_dict(actor_state_dict)
        else:
            print("No policy file found")
            sys.exit()

        envs.single_observation_space.dtype = np.float32

        # TRY NOT TO MODIFY: start the game
        obs, _ = envs.reset(seed=args.seed)
        for global_step in range(args.total_timesteps):
            with torch.no_grad():
                actions = actor(torch.Tensor(obs).to(device))
                actions = actions.cpu().numpy().clip(envs.single_action_space.low, envs.single_action_space.high)

            # TRY NOT TO MODIFY: execute the game and log data.
            next_obs, rewards, terminations, truncations, infos = envs.step(actions)

            all_data.append(next_obs)

    states_output_file_name = run_name_sanitized + "_states.pkl"
    file_out_path = os.path.join(args.states_output_path, states_output_file_name)

    with open(file_out_path, "wb") as handle:
        pickle.dump(all_data, handle, protocol=pickle.HIGHEST_PROTOCOL)

    envs.close()


#python cleanrl/sample_data_linearised_gelu.py --policy-dir-path data/ckpt/cheetah-linearised/ --total-timesteps 1000 --env-id HalfCheetah-v4  --actor-width 65536 --states-output-path data/states_rollouts/cheetah-linearised/