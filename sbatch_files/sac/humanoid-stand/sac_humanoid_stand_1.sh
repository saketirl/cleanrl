#!/bin/bash

#SBATCH -n 8
#SBATCH --mem=16G
#SBATCH --gres=gpu:1
#SBATCH -p 3090-gcondo
#SBATCH -t 72:00:00

module load anaconda/2023.09-0-7nso27y
module load cuda/11.8.0-lpttyok
source ~/.bash_profile
conda activate crate

cd /users/stiwari4/data/stiwari4/ratereduction/cleanrl/

wandb login 9fb4ba17a708de72496774b2e25d219f07de038d

python cleanrl/sac_continuous_action.py     --seed 1     --env-id dm_control/humanoid-stand-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/humanoid-stand/run5.out &
python cleanrl/sac_continuous_action.py     --seed 2     --env-id dm_control/humanoid-stand-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/humanoid-stand/run6.out
python cleanrl/sac_continuous_action.py     --seed 3     --env-id dm_control/humanoid-stand-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/humanoid-stand/run7.out &
python cleanrl/sac_continuous_action.py     --seed 4    --env-id dm_control/humanoid-stand-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/humanoid-stand/run8.out
python cleanrl/sac_continuous_action.py     --seed 5     --env-id dm_control/humanoid-stand-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/humanoid-stand/run13.out &
python cleanrl/sac_continuous_action.py     --seed 6     --env-id dm_control/humanoid-stand-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/humanoid-stand/run14.out
python cleanrl/sac_continuous_action.py     --seed 7     --env-id dm_control/humanoid-stand-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/humanoid-stand/run15.out &
python cleanrl/sac_continuous_action.py     --seed 8     --env-id dm_control/humanoid-stand-v0 --total-timesteps 4000000 --track --actor-width 1024 --q-width 1024 &> outputs/sac/humanoid-stand/run16.out
sleep 1800
