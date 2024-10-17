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

python cleanrl/sac_crate_continuous.py     --seed 9     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 --lambd 0.2 &> outputs/sac_crate/ant/run9_0.4.out
python cleanrl/sac_crate_continuous.py     --seed 10     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 --lambd 0.2 &> outputs/sac_crate/ant/run10_0.4.out
python cleanrl/sac_crate_continuous.py     --seed 11     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 --lambd 0.2 &> outputs/sac_crate/ant/run11_0.4.out
python cleanrl/sac_crate_continuous.py     --seed 12     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 --lambd 0.2 &> outputs/sac_crate/ant/run12_0.4.out
python cleanrl/sac_crate_continuous.py     --seed 13     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 --lambd 0.2 &> outputs/sac_crate/ant/run13_0.4.out
python cleanrl/sac_crate_continuous.py     --seed 14     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 --lambd 0.2 &> outputs/sac_crate/ant/run14_0.4.out
python cleanrl/sac_crate_continuous.py     --seed 15     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 --lambd 0.2 &> outputs/sac_crate/ant/run15_0.4.out
python cleanrl/sac_crate_continuous.py     --seed 16    --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 --lambd 0.2 &> outputs/sac_crate/ant/run16_0.4.out
