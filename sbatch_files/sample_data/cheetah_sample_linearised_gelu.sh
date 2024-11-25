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


python cleanrl/sample_data_linearised_gelu.py --policy-dir-path data/ckpt/cheetah-linearised/ --total-timesteps 1000 \
--env-id HalfCheetah-v4  --actor-width 4096 --states-output-path data/states_rollouts/cheetah-linearised/
python cleanrl/sample_data_linearised_gelu.py --policy-dir-path data/ckpt/cheetah-linearised/ --total-timesteps 1000 \
--env-id HalfCheetah-v4  --actor-width 8192 --states-output-path data/states_rollouts/cheetah-linearised/
python cleanrl/sample_data_linearised_gelu.py --policy-dir-path data/ckpt/cheetah-linearised/ --total-timesteps 1000 \
--env-id HalfCheetah-v4  --actor-width 16384 --states-output-path data/states_rollouts/cheetah-linearised/
python cleanrl/sample_data_linearised_gelu.py --policy-dir-path data/ckpt/cheetah-linearised/ --total-timesteps 1000 \
--env-id HalfCheetah-v4  --actor-width 32768 --states-output-path data/states_rollouts/cheetah-linearised/
python cleanrl/sample_data_linearised_gelu.py --policy-dir-path data/ckpt/cheetah-linearised/ --total-timesteps 1000 \
--env-id HalfCheetah-v4  --actor-width 65536 --states-output-path data/states_rollouts/cheetah-linearised/
python cleanrl/sample_data_linearised_gelu.py --policy-dir-path data/ckpt/cheetah-linearised/ --total-timesteps 1000 \
--env-id HalfCheetah-v4  --actor-width 131072 --states-output-path data/states_rollouts/cheetah-linearised/

sleep 1200