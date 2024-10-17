#!/bin/bash

#SBATCH -n 8
#SBATCH --mem=16G
#SBATCH --gres=gpu:1
#SBATCH -p 3090-gcondo
#SBATCH -t 24:00:00

module load anaconda/2023.09-0-7nso27y
module load cuda/11.8.0-lpttyok
source ~/.bash_profile
conda activate crate

cd /users/stiwari4/data/stiwari4/ratereduction/cleanrl/

wandb login 9fb4ba17a708de72496774b2e25d219f07de038d

python cleanrl/sac_continuous_action.py     --seed 1     --env-id dm_control/humanoid-run-v0 --total-timesteps 1000000 --track --actor-width 1024 &> outputs/sac/humanoid-run/run1.out
python cleanrl/sac_continuous_action.py     --seed 2     --env-id dm_control/humanoid-run-v0 --total-timesteps 1000000 --track --actor-width 1024 &> outputs/sac/humanoid-run/run2.out
python cleanrl/sac_continuous_action.py     --seed 3     --env-id dm_control/humanoid-run-v0 --total-timesteps 1000000 --track --actor-width 1024 &> outputs/sac/humanoid-run/run3.out
python cleanrl/sac_continuous_action.py     --seed 4     --env-id dm_control/humanoid-run-v0 --total-timesteps 1000000 --track --actor-width 1024 &> outputs/sac/humanoid-run/run4.out
python cleanrl/sac_continuous_action.py     --seed 9     --env-id dm_control/humanoid-run-v0 --total-timesteps 1000000 --track --actor-width 1024 &> outputs/sac/humanoid-run/run9.out
python cleanrl/sac_continuous_action.py     --seed 10    --env-id dm_control/humanoid-run-v0 --total-timesteps 1000000 --track --actor-width 1024 &> outputs/sac/humanoid-run/run10.out
python cleanrl/sac_continuous_action.py     --seed 11     --env-id dm_control/humanoid-run-v0 --total-timesteps 1000000 --track --actor-width 1024 &> outputs/sac/humanoid-run/run11.out
python cleanrl/sac_continuous_action.py     --seed 12     --env-id dm_control/humanoid-run-v0 --total-timesteps 1000000 --track --actor-width 1024 &> outputs/sac/humanoid-run/run12.out