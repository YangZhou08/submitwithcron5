#!/bin/bash
## job name
#SBATCH --job-name=yangzho6
## filename for job standard output (stdout)
## %j is the job id, %u is the user id

#SBATCH --output=/fsx-storygen/beidic/yang/log/log-%j.out
## filename for job standard error output (stderr)
#SBATCH --error=/fsx-storygen/beidic/yang/log/log-%j.err

#SBATCH --time=3:00:00 

## partition name
#SBATCH -q storygen 
#SBATCH -A storygen 
## number of nodes
#SBATCH --nodes=1

## number of tasks per node
#SBATCH --ntasks-per-node=1

#SBATCH --cpus-per-task=20
#SBATCH --gpus-per-node=8
#SBATCH --no-requeue
## SBATCH --array=0-11 # 12 jobs in total 

source /data/home/beidic/.bashrc
# source /data/home/beidic/anaconda3/etc/profile.d/conda.sh 
source /fsx-storygen/beidic/anaconda3/etc/profile.d/conda.sh
# source activate base
# conda activate base 
# mamba activate yangllm 
# conda activate yangllm 
# conda activate hanshi 
conda activate griffin 
# cd /fsx-storygen/beidic/yang/transformersprofiling 
# cd /fsx-storygen/beidic/yang/GRIFFIN2 
# cd /fsx-storygen/beidic/yang/CommonSenseReasoning 
cd /fsx-storygen/beidic/yang/bigcode-evaluation-harness 
# git checkout exp2 
# git checkout addinggriffin 
# git pull 

git pull 
# pip install termcolor 
# pip install -e . 

# pip install termcolor 
# pip install wandb 
# pip install datasets 
# pip install accelerate 
# pip install -U "huggingface_hub[cli]" 
# pip install matplotlib 
# pip install langdetect 
# pip install immutabledict 
# pip install sentencepiece 

which python 

export WANDB_API_KEY=fbb26fc8718b8e58d743b5cdcabaa2396656f773 
wandb login 

which python 
export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 
export ACCELERATE_TIMEOUT=1800
export NCCL_TIMEOUT=1800000
export NCCL_IB_TIMEOUT=23
export NCCL_SOCKET_TIMEOUT=23

# echo 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 | transformers-cli login 
huggingface-cli login --token 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 

accelerate launch --num_processes 8 main.py --tasks mbppplus --do_sample False --griffin --check --n_samples 1 --batch_size 1 --max_length_generation 512 --enable_epatches --allow_code_execution --widthtree 8 --model meta-llama/Llama-2-7b-hf 
