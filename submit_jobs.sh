#use your todo folder below
# cd /fsx-storygen/beidic/yang/submitwithcron/todo 
cd /fsx-storygen/beidic/yang/transformersprofiling 
git pull 

cd /fsx-storygen/beidic/yang/submitwithcron5/todo 

git fetch 
LOCAL=$(git rev-parse main) 
REMOTE=$(git rev-parse origin/main) 
changesToPull=false
if [ $LOCAL != $REMOTE ]; then
    changesToPull=true
fi
if $changesToPull; then
    echo "There are changes to pull $REMOTE" >> /fsx-storygen/beidic/yang/submitwithcron5/submitted/my_log_file.txt 
else
    echo "No changes to pull." >> /fsx-storygen/beidic/yang/submitwithcron5/submitted/my_log_file.txt 
fi 

git pull 

echo -e "$(date "+%Y-%m-%d %H:%M:%S") - Submitting jobs" >> /fsx-storygen/beidic/yang/submitwithcron5/submitted/my_log_file.txt 
echo -e "There are $(ls -1 *.sh | wc -l) .sh files to submit." >> /fsx-storygen/beidic/yang/submitwithcron5/submitted/my_log_file.txt 
for script in *.sh; do
   # /opt/slurm/bin/sbatch "$script" 
   echo -e "Submitting $script" >> /fsx-storygen/beidic/yang/submitwithcron5/submitted/my_log_file.txt 
   # job_id=$(/opt/slurm/bin/sbatch "$script" | awk '{print $4}') 
   job_id=$(/opt/slurm/bin/sbatch "$script") 
   echo -e "$(date "+%Y-%m-%d %H:%M:%S") - Job ID: $job_id" >> /fsx-storygen/beidic/yang/submitwithcron5/submitted/my_log_file.txt 
done 

output=$(/opt/slurm/bin/squeue -u beidic) 
echo -e "$output" >> /fsx-storygen/beidic/yang/submitwithcron5/submitted/my_log_file.txt 
echo -e "$(date "+%Y-%m-%d %H:%M:%S") - Done submitting jobs\n" >> /fsx-storygen/beidic/yang/submitwithcron5/submitted/my_log_file.txt 
# echo -e "/fsx-storygen/beidic/yang/model_checkpoints/largemodeltinyllama_bf2f352_223990/" >> /fsx-storygen/beidic/yang/submitwithcron/submitted/my_log_file.txt 
# echo -e "$(ls /fsx-storygen/beidic/yang/model_checkpoints/largemodeltinyllama_bf2f352_223990/)" >> /fsx-storygen/beidic/yang/submitwithcron/submitted/my_log_file.txt 
# echo -e "/fsx-storygen/beidic/yang/model_checkpoints/largemodeltinyllama_70a2287_928748/" >> /fsx-storygen/beidic/yang/submitwithcron/submitted/my_log_file.txt 
# echo -e "$(ls /fsx-storygen/beidic/yang/model_checkpoints/largemodeltinyllama_70a2287_928748/)" >> /fsx-storygen/beidic/yang/submitwithcron/submitted/my_log_file.txt 

wait

mv *.sh ../submitted 

cd /fsx-storygen/beidic/yang/submitwithcron5/bash_tasks 
echo -e "There are $(ls -1 *.sh | wc -l) .sh bash files to run" >> /fsx-storygen/beidic/yang/submitwithcron5/submitted/my_log_file.txt 
for script in *.sh; do 
    echo -e "Running $script" >> /fsx-storygen/beidic/yang/submitwithcron5/submitted/my_log_file.txt 
    bash -x "$script" >> /fsx-storygen/beidic/yang/submitwithcron5/submitted/my_log_file.txt 2>&1 & 
done 

mv *.sh ../submitted 

echo -e "attempting to move error files" >> /fsx-storygen/beidic/yang/submitwithcron5/submitted/my_log_file.txt 

# mv /fsx-storygen/beidic/yang/log/log-1550792.err ../submitted 
# mv /fsx-storygen/beidic/yang/log/log-1550792.out ../submitted 
# mv /fsx-storygen/beidic/yang/log/log-572507.err ../submitted 
# bash -x /fsx-storygen/beidic/yang/submitwithcron2/immediate_events.sh 

# bash -x mvcheckpoint.sh | tee -a /fsx-storygen/beidic/yang/submitwithcron2/submitted/my_log_file.txt 

git add ../submitted/ 
git add -A . 
git commit -a -m "submit jobs"
git push origin main 
