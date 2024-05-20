pwd 
rm -rf GRIFFIN2 
ls 
cd /fsx-storygen/beidic/yang/ 
git clone git@github.com:Infini-AI-Lab/GRIFFIN2.git 
cd GRIFFIN2 
# source /data/home/beidic/.bashrc 
# source /data/home/beidic/anaconda3/etc/profile.d/conda.sh 
conda env create -f griffin.yml 
conda activate griffin 
cd src 
pip install lm_eval 
