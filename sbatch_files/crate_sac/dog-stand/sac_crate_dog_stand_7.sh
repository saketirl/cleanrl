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

python cleanrl/sac_crate_continuous.py     --seed 17     --env-id dm_control/dog-stand-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/dog-stand/run9_0.5.out &
python cleanrl/sac_crate_continuous.py     --seed 18     --env-id dm_control/dog-stand-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/dog-stand/run10_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 19     --env-id dm_control/dog-stand-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/dog-stand/run11_0.5.out &
python cleanrl/sac_crate_continuous.py     --seed 20     --env-id dm_control/dog-stand-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/dog-stand/run12_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 21     --env-id dm_control/dog-stand-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/dog-stand/run13_0.5.out &
python cleanrl/sac_crate_continuous.py     --seed 22     --env-id dm_control/dog-stand-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/dog-stand/run14_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 23     --env-id dm_control/dog-stand-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/dog-stand/run15_0.5.out &
python cleanrl/sac_crate_continuous.py     --seed 24     --env-id dm_control/dog-stand-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/dog-stand/run16_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 25     --env-id dm_control/dog-stand-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/dog-stand/run9_0.5.out &
python cleanrl/sac_crate_continuous.py     --seed 26     --env-id dm_control/dog-stand-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/dog-stand/run10_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 27     --env-id dm_control/dog-stand-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/dog-stand/run11_0.5.out &
python cleanrl/sac_crate_continuous.py     --seed 28     --env-id dm_control/dog-stand-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/dog-stand/run12_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 29     --env-id dm_control/dog-stand-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/dog-stand/run13_0.5.out &
python cleanrl/sac_crate_continuous.py     --seed 30     --env-id dm_control/dog-stand-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/dog-stand/run14_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 31     --env-id dm_control/dog-stand-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/dog-stand/run15_0.5.out &
python cleanrl/sac_crate_continuous.py     --seed 32     --env-id dm_control/dog-stand-v0 --total-timesteps 1000000 --track \
--actor-width 1024 --crate-step-size 0.5 &> outputs/sac_crate/dog-stand/run16_0.5.out
sleep 1800