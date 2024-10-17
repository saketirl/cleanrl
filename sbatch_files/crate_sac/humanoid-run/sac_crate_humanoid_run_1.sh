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

python cleanrl/sac_crate_continuous.py     --seed 1     --env-id dm_control/humanoid-run-v0 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 &> outputs/sac_crate/humanoid-run/run1_0.4.out
python cleanrl/sac_crate_continuous.py     --seed 2     --env-id dm_control/humanoid-run-v0 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 &> outputs/sac_crate/humanoid-run/run2_0.4.out
python cleanrl/sac_crate_continuous.py     --seed 3     --env-id dm_control/humanoid-run-v0 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 &> outputs/sac_crate/humanoid-run/run3_0.4.out
python cleanrl/sac_crate_continuous.py     --seed 4     --env-id dm_control/humanoid-run-v0 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 &> outputs/sac_crate/humanoid-run/run4_0.4.out
python cleanrl/sac_crate_continuous.py     --seed 5     --env-id dm_control/humanoid-run-v0 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 &> outputs/sac_crate/humanoid-run/run5_0.4.out
python cleanrl/sac_crate_continuous.py     --seed 6     --env-id dm_control/humanoid-run-v0 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 &> outputs/sac_crate/humanoid-run/run6_0.4.out
python cleanrl/sac_crate_continuous.py     --seed 7     --env-id dm_control/humanoid-run-v0 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 &> outputs/sac_crate/humanoid-run/run7_0.4.out
python cleanrl/sac_crate_continuous.py     --seed 8     --env-id dm_control/humanoid-run-v0 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.4 &> outputs/sac_crate/humanoid-run/run8_0.4.out