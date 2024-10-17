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

python cleanrl/sac_crate_continuous.py     --seed 1     --env-id Humanoid-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.45 &> outputs/sac_crate/humanoid/run1_0.45.out
python cleanrl/sac_crate_continuous.py     --seed 2     --env-id Humanoid-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.45 &> outputs/sac_crate/humanoid/run2_0.45.out
python cleanrl/sac_crate_continuous.py     --seed 3     --env-id Humanoid-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.45 &> outputs/sac_crate/humanoid/run3_0.45.out
python cleanrl/sac_crate_continuous.py     --seed 4     --env-id Humanoid-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.45 &> outputs/sac_crate/humanoid/run4_0.45.out
python cleanrl/sac_crate_continuous.py     --seed 5     --env-id Humanoid-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.45 &> outputs/sac_crate/humanoid/run5_0.45.out
python cleanrl/sac_crate_continuous.py     --seed 6     --env-id Humanoid-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.45 &> outputs/sac_crate/humanoid/run6_0.45.out
python cleanrl/sac_crate_continuous.py     --seed 7     --env-id Humanoid-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.45 &> outputs/sac_crate/humanoid/run7_0.45.out
python cleanrl/sac_crate_continuous.py     --seed 8     --env-id Humanoid-v4 --total-timesteps 500000 --track \
--actor-width 1024 --crate-step-size 0.45 &> outputs/sac_crate/humanoid/run8_0.45.out