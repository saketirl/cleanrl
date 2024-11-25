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

python cleanrl/sac_crate_normed.py     --seed 23     --env-id dm_control/dog-stand-v0 --total-timesteps 4000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.4 --ckpt-n-step 100000 \
 --ckpt-dir data/crate_ckpt/dog-stand/&> outputs/sac_crate/dog-stand/run15_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 24     --env-id dm_control/dog-stand-v0 --total-timesteps 4000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.4 --ckpt-n-step 100000 \
 --ckpt-dir data/crate_ckpt/dog-stand/&> outputs/sac_crate/dog-stand/run16_0.5.out
python cleanrl/sac_crate_normed.py     --seed 25    --env-id dm_control/dog-stand-v0 --total-timesteps 4000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.4 --ckpt-n-step 100000 \
 --ckpt-dir data/crate_ckpt/dog-stand/&> outputs/sac_crate/dog-stand/run9_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 26     --env-id dm_control/dog-stand-v0 --total-timesteps 4000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.4 --ckpt-n-step 100000  \
--ckpt-dir data/crate_ckpt/dog-stand/&> outputs/sac_crate/dog-stand/run10_0.5.out

sleep 1800