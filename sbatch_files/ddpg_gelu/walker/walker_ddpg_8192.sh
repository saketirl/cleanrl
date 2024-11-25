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

python cleanrl/ddpg_gelu.py --seed 1 --env-id Walker2d-v4 --actor-width 8192 --critic-width 1024 \
 --track &> outputs/ddpg_gelu/walker/run1_128.out &
python cleanrl/ddpg_gelu.py --seed 2 --env-id Walker2d-v4 --actor-width 8192 --critic-width 1024 \
 --track &> outputs/ddpg_gelu/walker/run2_128.out
python cleanrl/ddpg_gelu.py --seed 3 --env-id Walker2d-v4 --actor-width 8192 --critic-width 1024 \
 --track &> outputs/ddpg_gelu/walker/run3_128.out &
python cleanrl/ddpg_gelu.py --seed 4 --env-id Walker2d-v4 --actor-width 8192 --critic-width 1024 \
 --track &> outputs/ddpg_gelu/walker/run4_128.out
python cleanrl/ddpg_gelu.py --seed 5 --env-id Walker2d-v4 --actor-width 8192 --critic-width 1024 \
 --track &> outputs/ddpg_gelu/walker/run5_128.out &
python cleanrl/ddpg_gelu.py --seed 6 --env-id Walker2d-v4 --actor-width 8192 --critic-width 1024 \
 --track &> outputs/ddpg_gelu/walker/run6_128.out
python cleanrl/ddpg_gelu.py --seed 7 --env-id Walker2d-v4 --actor-width 8192 --critic-width 1024 \
 --track &> outputs/ddpg_gelu/walker/run7_128.out &
python cleanrl/ddpg_gelu.py --seed 8 --env-id Walker2d-v4 --actor-width 8192 --critic-width 1024 \
 --track &> outputs/ddpg_gelu/walker/run8_128.out
python cleanrl/ddpg_gelu.py --seed 9 --env-id Walker2d-v4 --actor-width 8192 --critic-width 1024 \
 --track &> outputs/ddpg_gelu/walker/run9_128.out &
python cleanrl/ddpg_gelu.py --seed 10 --env-id Walker2d-v4 --actor-width 8192 --critic-width 1024 \
 --track &> outputs/ddpg_gelu/walker/run10_128.out
python cleanrl/ddpg_gelu.py --seed 11 --env-id Walker2d-v4 --actor-width 8192 --critic-width 1024 \
 --track &> outputs/ddpg_gelu/walker/run11_128.out &
python cleanrl/ddpg_gelu.py --seed 12 --env-id Walker2d-v4 --actor-width 8192 --critic-width 1024 \
 --track &> outputs/ddpg_gelu/walker/run12_128.out
 python cleanrl/ddpg_gelu.py --seed 13 --env-id Walker2d-v4 --actor-width 8192 --critic-width 1024 \
 --track &> outputs/ddpg_gelu/walker/run13_128.out &
python cleanrl/ddpg_gelu.py --seed 14 --env-id Walker2d-v4 --actor-width 8192 --critic-width 1024 \
 --track &> outputs/ddpg_gelu/walker/run14_128.out
python cleanrl/ddpg_gelu.py --seed 15 --env-id Walker2d-v4 --actor-width 8192 --critic-width 1024 \
 --track &> outputs/ddpg_gelu/walker/run15_128.out &
python cleanrl/ddpg_gelu.py --seed 16 --env-id Walker2d-v4 --actor-width 8192 --critic-width 1024 \
 --track &> outputs/ddpg_gelu/walker/run16_128.out

 sleep 1200