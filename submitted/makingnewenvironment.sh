#!/bin/bash
## job name
#SBATCH --job-name=yangzho6
## filename for job standard output (stdout)
## %j is the job id, %u is the user id

#SBATCH --output=/fsx-storygen/beidic/yang/log/log-%j.out
## filename for job standard error output (stderr)
#SBATCH --error=/fsx-storygen/beidic/yang/log/log-%j.err

#SBATCH --time=2:00:00 

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
# conda activate griffin 
# cd /fsx-storygen/beidic/yang/transformersprofiling 

cd /fsx-storygen/beidic/yang/submitwithcron5 

conda env create -f griffinrequre.yml 
conda activate griffin 
pip install -r requirements.txt 

python -c "import torch; print(torch.__version__); import transformers; print(transformers.__version__)" 
