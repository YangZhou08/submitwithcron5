#!/bin/bash
## job name
#SBATCH --job-name=yangzho6
## filename for job standard output (stdout)
## %j is the job id, %u is the user id

#SBATCH --output=/fsx-storygen/beidic/yang/submitwithcron5/submitted/log-%j.out
## filename for job standard error output (stderr)
#SBATCH --error=/fsx-storygen/beidic/yang/submitwithcron5/submitted/log-%j.err

#SBATCH --time=24:00:00 

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
conda activate griffinn 
# cd /fsx-storygen/beidic/yang/transformersprofiling 
cd /fsx-storygen/beidic/yang/GRIFFIN2 
# cd /fsx-storygen/beidic/yang/CommonSenseReasoning 
# git checkout exp2 
# git checkout addinggriffin 
# git checkout yangexp2two 
git add .
git stash 
git checkout yangexppp 
git pull 

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
# pip install --upgrade setuptools packaging
# pip install --upgrade --force-reinstall peft

which python 

export WANDB_API_KEY=fbb26fc8718b8e58d743b5cdcabaa2396656f773 
wandb login 

which python 
export CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 

# echo 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 | transformers-cli login 
huggingface-cli login --token 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 

# lengthss=(128 256 512 1024 1500 2048 3072 4096) 
# for length in "${lengthss[@]}" 
# do 
#     python main.py --model xhf --model_args pretrained=meta-llama/Meta-Llama-3-8B-Instruct,griffin=False,check=False,contextlength=$length,kernel_size=10,thr=0.05,attentionimplementation=sdpa --tasks gsm8k_cot --batch_size 1 --limit 0.3 
#     python main.py --model xhf --model_args pretrained=meta-llama/Meta-Llama-3-8B-Instruct,griffin=True,check=False,contextlength=$length,kernel_size=10,thr=0.05,attentionimplementation=sdpa --tasks gsm8k_cot --batch_size 1 --limit 0.3 
# done 
# lengs=(1 2 4 8 16 32 64 96) 
# for leng in "${lengs[@]}" 
# do 
#     TOKENIZERS_PARALLELISM=false python getcompilego.py --length $leng 
# done 
python main.py --model xhf --model_args pretrained=meta-llama/Meta-Llama-3-70B-Instruct,cats=True,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks mmlu_flan_cot_fewshot --batch_size 1 --limit 750 
