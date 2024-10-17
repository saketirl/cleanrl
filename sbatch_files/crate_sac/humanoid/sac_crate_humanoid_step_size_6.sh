#!/bin/bash

#SBATCH -n 8
#SBATCH --mem=16G
#SBATCH --gres=gpu:1
#SBATCH -p 3090-gcondo
#SBATCH -t 36:00:00

module load anaconda/2023.09-0-7nso27y
module load cuda/11.8.0-lpttyok
source ~/.bash_profile
conda activate crate

cd /users/stiwari4/data/stiwari4/ratereduction/cleanrl/

wandb login 9fb4ba17a708de72496774b2e25d219f07de038d

python cleanrl/sac_crate_continuous.py     --seed 9     --env-id Humanoid-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.45 &> outputs/sac_crate/humanoid/run9_0.45.out
python cleanrl/sac_crate_continuous.py     --seed 10     --env-id Humanoid-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.45 &> outputs/sac_crate/humanoid/run10_0.45.out
python cleanrl/sac_crate_continuous.py     --seed 11     --env-id Humanoid-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.45 &> outputs/sac_crate/humanoid/run11_0.45.out
python cleanrl/sac_crate_continuous.py     --seed 12     --env-id Humanoid-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.45 &> outputs/sac_crate/humanoid/run12_0.45.out
python cleanrl/sac_crate_continuous.py     --seed 13     --env-id Humanoid-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.45 &> outputs/sac_crate/humanoid/run13_0.45.out
python cleanrl/sac_crate_continuous.py     --seed 14     --env-id Humanoid-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.45 &> outputs/sac_crate/humanoid/run14_0.45.out
python cleanrl/sac_crate_continuous.py     --seed 15     --env-id Humanoid-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.45 &> outputs/sac_crate/humanoid/run15_0.45.out
python cleanrl/sac_crate_continuous.py     --seed 16     --env-id Humanoid-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.45 &> outputs/sac_crate/humanoid/run16_0.45.out
