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

python cleanrl/sac_crate_continuous.py     --seed 5     --env-id Pusher-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 &> outputs/sac_crate/pusher/run5.out
python cleanrl/sac_crate_continuous.py     --seed 6     --env-id Pusher-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 &> outputs/sac_crate/pusher/run6.out
python cleanrl/sac_crate_continuous.py     --seed 7     --env-id Pusher-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 &> outputs/sac_crate/pusher/run7.out
python cleanrl/sac_crate_continuous.py     --seed 8     --env-id Pusher-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 &> outputs/sac_crate/pusher/run8.out
python cleanrl/sac_crate_continuous.py     --seed 13     --env-id Pusher-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 &> outputs/sac_crate/pusher/run13.out
python cleanrl/sac_crate_continuous.py     --seed 14     --env-id Pusher-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 &> outputs/sac_crate/pusher/run14.out
python cleanrl/sac_crate_continuous.py     --seed 15     --env-id Pusher-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 &> outputs/sac_crate/pusher/run7.out
python cleanrl/sac_crate_continuous.py     --seed 16     --env-id Pusher-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 &> outputs/sac_crate/pusher/run16.out
