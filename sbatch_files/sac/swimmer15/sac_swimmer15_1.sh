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

python cleanrl/sac_continuous_action.py     --seed 17     --env-id dm_control/swimmer15-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/dog-trot/swimmer15/run5.out &
python cleanrl/sac_continuous_action.py     --seed 18    --env-id dm_control/swimmer15-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/dog-trot/swimmer15/run6.out
python cleanrl/sac_continuous_action.py     --seed 19     --env-id dm_control/swimmer15-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/dog-trot/swimmer15/run7.out &
python cleanrl/sac_continuous_action.py     --seed 20     --env-id dm_control/swimmer15-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/dog-trot/swimmer15/run8.out
python cleanrl/sac_continuous_action.py     --seed 21     --env-id dm_control/swimmer15-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/dog-trot/swimmer15/run13.out &
python cleanrl/sac_continuous_action.py     --seed 22     --env-id dm_control/swimmer15-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/dog-trot/swimmer15/run14.out
python cleanrl/sac_continuous_action.py     --seed 23     --env-id dm_control/swimmer15-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/dog-trot/swimmer15/run15.out &
python cleanrl/sac_continuous_action.py     --seed 24     --env-id dm_control/swimmer15-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/dog-trot/swimmer15/run16.out
python cleanrl/sac_continuous_action.py     --seed 17     --env-id dm_control/swimmer15-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/dog-trot/swimmer15/run5.out &
python cleanrl/sac_continuous_action.py     --seed 18    --env-id dm_control/swimmer15-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/dog-trot/swimmer15/run6.out
python cleanrl/sac_continuous_action.py     --seed 19     --env-id dm_control/swimmer15-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/dog-trot/swimmer15/run7.out &
python cleanrl/sac_continuous_action.py     --seed 20     --env-id dm_control/swimmer15-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/dog-trot/swimmer15/run8.out
python cleanrl/sac_continuous_action.py     --seed 21     --env-id dm_control/swimmer15-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/dog-trot/swimmer15/run13.out &
python cleanrl/sac_continuous_action.py     --seed 22     --env-id dm_control/swimmer15-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/dog-trot/swimmer15/run14.out
python cleanrl/sac_continuous_action.py     --seed 23     --env-id dm_control/swimmer15-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/dog-trot/swimmer15/run15.out &
python cleanrl/sac_continuous_action.py     --seed 24     --env-id dm_control/swimmer15-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/dog-trot/swimmer15/run16.out
sleep 1800