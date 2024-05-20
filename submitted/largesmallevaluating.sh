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
conda activate yangllm 
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
export CUDA_VISIBLE_DEVICES=0 

echo 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 | transformers-cli login 
huggingface-cli login --token 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 

cd datasets_evaluation 
python Evaluation_language_modeling_3.py --model_name debugging --dataset_name c4 --loading_from_checkpoint /fsx-storygen/beidic/yang/model_checkpoints/largemodeltinyllama_f31a056_710474/checkpoint-3000 
