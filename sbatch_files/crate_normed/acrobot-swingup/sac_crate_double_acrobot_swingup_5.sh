#!/bin/bash

#SBATCH -n 8
#SBATCH --mem=16G
#SBATCH --gres=gpu:1
#SBATCH -p 3090-gcondo
#SBATCH -t 48:00:00

module load anaconda/2023.09-0-7nso27y
module load cuda/11.8.0-lpttyok
source ~/.bash_profile
conda activate crate

cd /users/stiwari4/data/stiwari4/ratereduction/cleanrl/

wandb login 9fb4ba17a708de72496774b2e25d219f07de038d

python cleanrl/sac_crate_normed.py     --seed 17    --env-id dm_control/acrobot-swingup-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.05 --q-crate-step-size 0.025 &> outputs/sac_crate/acrobot-swingup/run9_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 18     --env-id dm_control/acrobot-swingup-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.05 --q-crate-step-size 0.025 &> outputs/sac_crate/acrobot-swingup/run10_0.5.out
python cleanrl/sac_crate_normed.py     --seed 19     --env-id dm_control/acrobot-swingup-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.05 --q-crate-step-size 0.025 &> outputs/sac_crate/acrobot-swingup/run11_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 20     --env-id dm_control/acrobot-swingup-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.05 --q-crate-step-size 0.025 &> outputs/sac_crate/acrobot-swingup/run12_0.5.out
python cleanrl/sac_crate_normed.py     --seed 21     --env-id dm_control/acrobot-swingup-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.05 --q-crate-step-size 0.025 &> outputs/sac_crate/acrobot-swingup/run13_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 22     --env-id dm_control/acrobot-swingup-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.05 --q-crate-step-size 0.025 &> outputs/sac_crate/acrobot-swingup/run14_0.5.out
python cleanrl/sac_crate_normed.py     --seed 23     --env-id dm_control/acrobot-swingup-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.05 --q-crate-step-size 0.025 &> outputs/sac_crate/acrobot-swingup/run15_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 24     --env-id dm_control/acrobot-swingup-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.05 --q-crate-step-size 0.025 &> outputs/sac_crate/acrobot-swingup/run16_0.5.out
python cleanrl/sac_crate_normed.py     --seed 25    --env-id dm_control/acrobot-swingup-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.05 --q-crate-step-size 0.025 &> outputs/sac_crate/acrobot-swingup/run9_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 26     --env-id dm_control/acrobot-swingup-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.05 --q-crate-step-size 0.025 &> outputs/sac_crate/acrobot-swingup/run10_0.5.out
python cleanrl/sac_crate_normed.py     --seed 27     --env-id dm_control/acrobot-swingup-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.05 --q-crate-step-size 0.025 &> outputs/sac_crate/acrobot-swingup/run11_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 28     --env-id dm_control/acrobot-swingup-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.05 --q-crate-step-size 0.025 &> outputs/sac_crate/acrobot-swingup/run12_0.5.out
python cleanrl/sac_crate_normed.py     --seed 29     --env-id dm_control/acrobot-swingup-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.05 --q-crate-step-size 0.025 &> outputs/sac_crate/acrobot-swingup/run13_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 30     --env-id dm_control/acrobot-swingup-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.05 --q-crate-step-size 0.025 &> outputs/sac_crate/acrobot-swingup/run14_0.5.out
python cleanrl/sac_crate_normed.py     --seed 31     --env-id dm_control/acrobot-swingup-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.05 --q-crate-step-size 0.025 &> outputs/sac_crate/acrobot-swingup/run15_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 32     --env-id dm_control/acrobot-swingup-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.05 --q-crate-step-size 0.025 &> outputs/sac_crate/acrobot-swingup/run16_0.5.out
sleep 1800