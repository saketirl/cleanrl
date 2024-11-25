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

python cleanrl/sac_crate_continuous.py     --seed 9     --env-id dm_control/quadruped-run-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/quadruped-run/run9_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 10     --env-id dm_control/quadruped-run-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/quadruped-run/run10_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 11     --env-id dm_control/quadruped-run-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/quadruped-run/run11_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 12     --env-id dm_control/quadruped-run-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/quadruped-run/run12_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 13     --env-id dm_control/quadruped-run-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/quadruped-run/run13_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 14     --env-id dm_control/quadruped-run-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/quadruped-run/run14_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 15     --env-id dm_control/quadruped-run-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/quadruped-run/run15_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 16     --env-id dm_control/quadruped-run-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/quadruped-run/run16_0.5.out