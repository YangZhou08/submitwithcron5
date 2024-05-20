#use your todo folder below
# cd /fsx-storygen/beidic/yang/submitwithcron/todo 
cd /fsx-storygen/beidic/yang/transformersprofiling 
git pull 

cd /fsx-storygen/beidic/yang/submitwithcron2/todo 

git fetch 
LOCAL=$(git rev-parse main) 
REMOTE=$(git rev-parse origin/main) 
changesToPull=false
if [ $LOCAL != $REMOTE ]; then
    changesToPull=true
fi
if $changesToPull; then
    echo "There are changes to pull $REMOTE" >> /fsx-storygen/beidic/yang/submitwithcron2/submitted/my_log_file.txt 
else
    echo "No changes to pull." >> /fsx-storygen/beidic/yang/submitwithcron2/submitted/my_log_file.txt 
fi 

git pull 

echo -e "$(date "+%Y-%m-%d %H:%M:%S") - Submitting jobs" >> /fsx-storygen/beidic/yang/submitwithcron2/submitted/my_log_file.txt 
echo -e "There are $(ls -1 *.sh | wc -l) .sh files to submit." >> /fsx-storygen/beidic/yang/submitwithcron2/submitted/my_log_file.txt 
for script in *.sh; do
   # /opt/slurm/bin/sbatch "$script" 
   echo -e "Submitting $script" >> /fsx-storygen/beidic/yang/submitwithcron2/submitted/my_log_file.txt 
   # job_id=$(/opt/slurm/bin/sbatch "$script" | awk '{print $4}') 
   job_id=$(/opt/slurm/bin/sbatch "$script") 
   echo -e "$(date "+%Y-%m-%d %H:%M:%S") - Job ID: $job_id" >> /fsx-storygen/beidic/yang/submitwithcron2/submitted/my_log_file.txt 
done 

output=$(/opt/slurm/bin/squeue -u beidic) 
echo -e "$output" >> /fsx-storygen/beidic/yang/submitwithcron2/submitted/my_log_file.txt 
echo -e "$(date "+%Y-%m-%d %H:%M:%S") - Done submitting jobs\n" 
# echo -e "/fsx-storygen/beidic/yang/model_checkpoints/largemodeltinyllama_bf2f352_223990/" >> /fsx-storygen/beidic/yang/submitwithcron/submitted/my_log_file.txt 
# echo -e "$(ls /fsx-storygen/beidic/yang/model_checkpoints/largemodeltinyllama_bf2f352_223990/)" >> /fsx-storygen/beidic/yang/submitwithcron/submitted/my_log_file.txt 
# echo -e "/fsx-storygen/beidic/yang/model_checkpoints/largemodeltinyllama_70a2287_928748/" >> /fsx-storygen/beidic/yang/submitwithcron/submitted/my_log_file.txt 
# echo -e "$(ls /fsx-storygen/beidic/yang/model_checkpoints/largemodeltinyllama_70a2287_928748/)" >> /fsx-storygen/beidic/yang/submitwithcron/submitted/my_log_file.txt 

wait

mv *.sh ../submitted 

echo -e "attempting to move error files" 

# mv /fsx-storygen/beidic/yang/log/log-471782.err ../submitted 

git add ../submitted/ 
git add -A . 
git commit -a -m "submit jobs"
git push origin main 
