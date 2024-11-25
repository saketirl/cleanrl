#!/bin/bash

#SBATCH -n 8
#SBATCH --mem=16G
#SBATCH --gres=gpu:1
#SBATCH -p 3090-gcondo
#SBATCH -t 56:00:00

module load anaconda/2023.09-0-7nso27y
module load cuda/11.8.0-lpttyok
source ~/.bash_profile
conda activate crate

cd /users/stiwari4/data/stiwari4/ratereduction/cleanrl/

wandb login 9fb4ba17a708de72496774b2e25d219f07de038d

python cleanrl/sac_crate_normed.py     --seed 23     --env-id dm_control/humanoid-run-v0 --total-timesteps 4000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.3 --q-crate-step-size 0.2 &> outputs/sac_crate/humanoid-run/run15_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 24     --env-id dm_control/humanoid-run-v0 --total-timesteps 4000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.3 --q-crate-step-size 0.2 &> outputs/sac_crate/humanoid-run/run16_0.5.out
python cleanrl/sac_crate_normed.py     --seed 25    --env-id dm_control/humanoid-run-v0 --total-timesteps 4000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.3 --q-crate-step-size 0.2 &> outputs/sac_crate/humanoid-run/run9_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 26     --env-id dm_control/humanoid-run-v0 --total-timesteps 4000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.3 --q-crate-step-size 0.2 &> outputs/sac_crate/humanoid-run/run10_0.5.out
python cleanrl/sac_crate_normed.py     --seed 27     --env-id dm_control/humanoid-run-v0 --total-timesteps 4000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.3 --q-crate-step-size 0.2 &> outputs/sac_crate/humanoid-run/run11_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 28     --env-id dm_control/humanoid-run-v0 --total-timesteps 4000000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.3 --q-crate-step-size 0.2 &> outputs/sac_crate/humanoid-run/run12_0.5.out

sleep 1800