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

python cleanrl/sac_crate_continuous.py     --seed 1     --env-id HalfCheetah-v4 --total-timesteps 100000 --track \
--crate-step-size 0.5 &> outputs/sac_crate/cheetah/run1_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 2     --env-id HalfCheetah-v4 --total-timesteps 100000 --track \
--crate-step-size 0.5 &> outputs/sac_crate/cheetah/run2_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 3     --env-id HalfCheetah-v4 --total-timesteps 100000 --track \
--crate-step-size 0.5 &> outputs/sac_crate/cheetah/run3_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 4     --env-id HalfCheetah-v4 --total-timesteps 100000 --track \
--crate-step-size 0.5 &> outputs/sac_crate/cheetah/run4_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 5     --env-id HalfCheetah-v4 --total-timesteps 100000 --track \
--crate-step-size 0.5 &> outputs/sac_crate/cheetah/run5_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 6     --env-id HalfCheetah-v4 --total-timesteps 100000 --track \
--crate-step-size 0.5 &> outputs/sac_crate/cheetah/run6_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 7     --env-id HalfCheetah-v4 --total-timesteps 100000 --track \
--crate-step-size 0.5 &> outputs/sac_crate/cheetah/run7_0.5.out
python cleanrl/sac_crate_continuous.py     --seed 8     --env-id HalfCheetah-v4 --total-timesteps 100000 --track \
--crate-step-size 0.5 &> outputs/sac_crate/cheetah/run8_0.5.out