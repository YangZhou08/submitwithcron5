source /data/home/beidic/.bashrc
# source /data/home/beidic/anaconda3/etc/profile.d/conda.sh 
source /fsx-storygen/beidic/anaconda3/etc/profile.d/conda.sh

source activate base 
conda activate base 
conda activate hanshi 

pip install wandb 
pip install accelerate 

python -c "import wandb; print(wandb.__file__)" 
python -c "import accelerate; print(accelerate.__file__)" 
