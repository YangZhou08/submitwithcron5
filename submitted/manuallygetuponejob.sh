cd /fsx-storygen/beidic/yang/submitwithcron2/todo 
/opt/slurm/bin/sbatch /fsx-storygen/beidic/yang/submitwithcron2/submitted/largesmallcombined_finetuning5.sh 
# /opt/slurm/bin/sbatch /fsx-storygen/beidic/yang/submitwithcron2/submitted/kernelsize7_setting0finetunesammodel.sh 
/opt/slurm/bin/squeue -u beidic 
/opt/slurm/bin/scancel 1869851 
