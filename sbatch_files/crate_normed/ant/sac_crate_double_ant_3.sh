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

python cleanrl/sac_crate_normed.py     --seed 17    --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.3 &> outputs/sac_crate/ant/run9_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 18     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.3 &> outputs/sac_crate/ant/run10_0.5.out
python cleanrl/sac_crate_normed.py     --seed 19     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.3 &> outputs/sac_crate/ant/run11_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 20     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.3 &> outputs/sac_crate/ant/run12_0.5.out
python cleanrl/sac_crate_normed.py     --seed 21     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.3 &> outputs/sac_crate/ant/run13_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 22     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.3 &> outputs/sac_crate/ant/run14_0.5.out
python cleanrl/sac_crate_normed.py     --seed 23     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.3 &> outputs/sac_crate/ant/run15_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 24     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.3 &> outputs/sac_crate/ant/run16_0.5.out
python cleanrl/sac_crate_normed.py     --seed 25    --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.3 &> outputs/sac_crate/ant/run9_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 26     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.3 &> outputs/sac_crate/ant/run10_0.5.out
python cleanrl/sac_crate_normed.py     --seed 27     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.3 &> outputs/sac_crate/ant/run11_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 28     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.3 &> outputs/sac_crate/ant/run12_0.5.out
python cleanrl/sac_crate_normed.py     --seed 29     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.3 &> outputs/sac_crate/ant/run13_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 30     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.3 &> outputs/sac_crate/ant/run14_0.5.out
python cleanrl/sac_crate_normed.py     --seed 31     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.3 &> outputs/sac_crate/ant/run15_0.5.out &
python cleanrl/sac_crate_normed.py     --seed 32     --env-id Ant-v4 --total-timesteps 500000 --track \
--actor-width 1024 --q-width 1024 --crate-step-size 0.5 --q-crate-step-size 0.3 &> outputs/sac_crate/ant/run16_0.5.out
sleep 1800