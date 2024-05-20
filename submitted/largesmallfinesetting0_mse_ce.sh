#!/bin/bash
## job name
#SBATCH --job-name=yangzho694363
## filename for job standard output (stdout)
## %j is the job id, %u is the user id

#SBATCH --output=/fsx-storygen/beidic/yang/log/log-%j.out
## filename for job standard error output (stderr)
#SBATCH --error=/fsx-storygen/beidic/yang/log/log-%j.err

#SBATCH --time=48:00:00 

## partition name
#SBATCH --partition=storygen
## number of nodes
#SBATCH --nodes=1

## number of tasks per node
#SBATCH --ntasks-per-node=1

#SBATCH --cpus-per-task=20
#SBATCH --gpus-per-node=8
#SBATCH --no-requeue
## SBATCH --array=0-11 # 12 jobs in total 

source /data/home/beidic/.bashrc
source /data/home/beidic/miniconda/etc/profile.d/conda.sh 
# source activate base
conda activate zoo-torch20
cd /fsx-storygen/beidic/yang/transformersprofiling 
pip install termcolor 
pip install -e . 
which python 

export WANDB_API_KEY=fbb26fc8718b8e58d743b5cdcabaa2396656f773 
wandb login 

which python 
export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 

echo 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 | transformers-cli login 
huggingface-cli login --token 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 

# python largemodelfinetuning_mseplusceloss.py 
# accelerate launch --main_process_port 29505 --num_processes 8 --num_machines 1 largemodelfinetuning_mseplusceloss2.py --large_model tinyllama --kernel_size 7 --use_mse_loss --freeze_small_model --use_pretrained_small_model --finetuned_small_model_checkpoint YangZhoumill/llama_160m_deciphering_tinyllama_setting0_01da4cb_hf --batch_size 128 
# accelerate launch --main_process_port 29505 --num_processes 8 --num_machines 1 largemodelfinetuning_mseplusceloss2.py --large_model tinyllama --kernel_size 7 --batch_size 128 --experiment_setting setting0 
accelerate launch --main_process_port 29505 --num_processes 8 --num_machines 1 largemodelfinetuning_mseplusceloss2.py --large_model tinyllama --kernel_size 7 --use_pretrained_small_model --finetuned_small_model_checkpoint YangZhoumill/llama_160m_deciphering_tinyllama_setting0_01da4cb_hf --batch_size 128 --experiment_setting setting0 --lr 2e-4 
# accelerate launch --main_process_port 29505 --num_processes 8 --num_machines 1 largemodelfinetuning_mseplusceloss2.py --large_model tinyllama --kernel_size 7 --batch_size 128 --use_pretrained_small_model --finetuned_small_model_checkpoint YangZhoumill/llama-160m_deciphering_tinyllama_setting3_bfafdfa_hf --freeze_small_model 
