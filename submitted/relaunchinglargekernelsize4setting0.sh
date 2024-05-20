#!/bin/bash
## job name
#SBATCH --job-name=yangzho6
## filename for job standard output (stdout)
## %j is the job id, %u is the user id

#SBATCH --output=/fsx-storygen/beidic/yang/log/log-%j.out
## filename for job standard error output (stderr)
#SBATCH --error=/fsx-storygen/beidic/yang/log/log-%j.err

#SBATCH --time=150:00:00 

## partition name
#SBATCH --partition=storygen
#SBATCH --account=fairaws-storygen
## number of nodes
#SBATCH --nodes=1

## number of tasks per node
#SBATCH --ntasks-per-node=1

#SBATCH --cpus-per-task=20
#SBATCH --gpus-per-node=8
#SBATCH --no-requeue
## SBATCH --array=0-11 # 12 jobs in total 

source /data/home/beidic/.bashrc
source /data/home/beidic/anaconda3/etc/profile.d/conda.sh 
# source activate base
# conda activate base 
# mamba activate yangllm 
# conda activate yangllm 
conda activate yangllm2 
cd /fsx-storygen/beidic/yang/transformersprofiling 
git pull 
# pip install termcolor 
pip install -e . 
pip install termcolor 
pip install wandb 
pip install datasets 
pip install accelerate 
pip install -U "huggingface_hub[cli]" 
pip install matplotlib 
pip install sentencepiece 
pip install peft 
which python 

export WANDB_API_KEY=fbb26fc8718b8e58d743b5cdcabaa2396656f773 
wandb login 

which python 
export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 

echo 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 | transformers-cli login 
huggingface-cli login --token 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 

# /data/home/beidic/anaconda3/envs/yangllm2/bin/accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 weird_training_largeplussmall.py --experiment_setting setting3 --kernel_size 2 --model_name tinyllama --batch_size 24 --use_large_model --autoregressive_first_element --group1lr 1.5e-5 --usedatasettype c4 --num_epoch 5 --finetune_checkpoint /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting3_2_ff438f8_670600/checkpoint-1000/ --resume_from_checkpoint /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting3_2_8722cf9_236687/checkpoint-500/ --wandb_session hzl4fcpm --wandb_session_name tinyllama_kernelsize2_batchsize24k --fullcoverage --path_d 0 --datafilegranularity 48 --gradient_accumulation_steps 128 --warmup_steps 1000 
# /data/home/beidic/anaconda3/envs/yangllm2/bin/accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 weird_training_largeplussmalllora.py --experiment_setting setting0 --kernel_size 2 --model_name tinyllama --batch_size 32 --use_large_model --autoregressive_first_element --group1lr 1.5e-5 --usedatasettype c4 --num_epoch 5 --finetune_checkpoint /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_2_ff438f8_013712/checkpoint-1000/ --fullcoverage --path_d 0 --datafilegranularity 24 --gradient_accumulation_steps 16 --warmup_steps 1000 
/data/home/beidic/anaconda3/envs/yangllm2/bin/accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 weird_training_largeplussmall.py --experiment_setting setting0 --kernel_size 4 --model_name tinyllama --batch_size 24 --use_large_model --autoregressive_first_element --group1lr 1.5e-5 --usedatasettype c4 --num_epoch 5 --finetune_checkpoint /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_4_5d0c042_660710/checkpoint-1000/ --fullcoverage --path_d 0 --datafilegranularity 24 --gradient_accumulation_steps 16 --warmup_steps 1000 --larger_lr_small 
