#!/bin/bash
## job name
#SBATCH --job-name=yangzho6
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
# accelerate launch --main_process_port 29505 --num_processes 8 --num_machines 1 largemodelfinetuning_mseplusceloss2.py --large_model tinyllama --kernel_size 7 --freeze_small_model --use_pretrained_small_model --finetuned_small_model_checkpoint YangZhoumill/llama-160m_deciphering_tinyllama_setting3_bfafdfa_hf --batch_size 128 --alpha 0.9 --lr 5e-5 --resume_from_checkpoint /fsx-storygen/beidic/yang/model_checkpoints/largemodeltinyllama_70a2287_189183/checkpoint-3000 
# accelerate launch --main_process_port 29506 --num_processes 8 --num_machines 1 largemodelfinetuning_mseplusceloss2.py --large_model tinyllama --kernel_size 7 --use_pretrained_small_model --finetuned_small_model_checkpoint YangZhoumill/llama-160m_deciphering_tinyllama_setting3_bfafdfa_hf --batch_size 128 --ce_loss_only --lr 2e-4 
# /data/home/beidic/anaconda3/envs/yangllm2/bin/accelerate launch --main_process_port 29508 --num_processes 8 --num_machines 1 largemodelfinetuning_msepluscelosstwo.py --large_model tinyllama --kernel_size 7 --alpha 0.5 --ce_loss_only --experiment_setting setting3 --batch_size 128 --lr 2e-4 
# /data/home/beidic/anaconda3/envs/yangllm2/bin/accelerate launch --main_process_port 29508 --num_processes 8 --num_machines 1 largemodelfinetuning_mseplusceloss2.py --large_model tinyllama --kernel_size 7 --alpha 0.5 --experiment_setting setting3 --batch_size 128 --lr 2e-4 --use_new_small_model_checkpoint --hybrid_compress --full_sequence_length_layer_pos 3 
/data/home/beidic/anaconda3/envs/yangllm2/bin/accelerate launch --main_process_port 29509 --num_processes 8 --num_machines 1 largemodelfinetuning_mseplusceloss2.py --large_model tinyllama --kernel_size 7 --alpha 0.5 --ce_loss_only --experiment_setting setting3 --batch_size 64 --use_new_small_model_checkpoint --lr 2e-4 --use_c4 --hybrid_compress --full_sequence_length_layer_pos 10 --epoch_idx 0 
# accelerate launch --main_process_port 29505 --num_processes 8 --num_machines 1 largemodelfinetuning_mseplusceloss2.py --large_model tinyllama --kernel_size 7 --batch_size 128 --use_pretrained_small_model --finetuned_small_model_checkpoint YangZhoumill/llama-160m_deciphering_tinyllama_setting3_bfafdfa_hf --freeze_small_model 
