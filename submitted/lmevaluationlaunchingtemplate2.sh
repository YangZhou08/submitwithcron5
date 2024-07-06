#!/bin/bash

cd /fsx-storygen/beidic/yang/GRIFFIN2
git branch 
git add .
git stash 
git pull origin yangexp2threee 
git branch yangexp2threee 
git checkout yangexp2threee 
git pull 
ls 

models=(
    # "meta-llama/Meta-Llama-3-8B-Instruct"
    # "meta-llama/Meta-Llama-3-8B"
    # "meta-llama/Llama-2-7b-chat-hf"
    # "meta-llama/Llama-2-7b-hf"
    "meta-llama/Llama-2-13b-chat-hf", 
    "meta-llama/Llama-2-13b-hf", 
)  

# List of commands to run
commands=(
    "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --model xhf --model_args pretrained=MODEL,widthtree=1,cats=True,check=True,kernel_size=16,spr=0.5,thr=0.1,patternstrict=True --tasks gsm8k --batch_size 1 "
    "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --model xhf --model_args pretrained=MODEL,widthtree=6,cats=True,check=True,kernel_size=16,spr=0.5,thr=0.1,patternstrict=True --tasks gsm8k --batch_size 1 " 
    "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --model xhf --model_args pretrained=MODEL,widthtree=4,cats=True,check=True,kernel_size=16,spr=0.5,thr=0.1,patternstrict=True --tasks gsm8k --batch_size 1 " 
    "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --model xhf --model_args pretrained=MODEL,widthtree=8,cats=True,check=True,kernel_size=16,spr=0.5,thr=0.1,patternstrict=True --tasks gsm8k --batch_size 1 " 
    "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --model xhf --model_args pretrained=MODEL,widthtree=1,griffin=True,check=True,kernel_size=16,spr=0.5,thr=0.1 --tasks gsm8k --batch_size 1 " 
    "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --model xhf --model_args pretrained=MODEL,widthtree=6,griffin=True,check=True,kernel_size=16,spr=0.5,thr=0.1 --tasks gsm8k --batch_size 1 " 
    "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --model xhf --model_args pretrained=MODEL,widthtree=4,griffin=True,check=True,kernel_size=16,spr=0.5,thr=0.1 --tasks gsm8k --batch_size 1 " 
    "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --model xhf --model_args pretrained=MODEL,widthtree=8,griffin=True,check=True,kernel_size=16,spr=0.5,thr=0.1 --tasks gsm8k --batch_size 1 " 
) 

# Iterate over the commands and submit a job for each
for cmd in "${commands[@]}"; do
    for model in "${models[@]}"; do
        # Create a temporary job script 
        unique_id=$(date +%s%N | sha256sum | base64 | head -c 5)
        job_script=$(mktemp /fsx-storygen/beidic/yang/submitwithcron5/submitted/job-$unique_id-XXXXXX.sh)

        # fullcmd="$cmd --model $model"
        fullcmd="${cmd/MODEL/$model}"
        
        # Fill in the placeholder in the template with the actual command
        sed "s|COMMAND_PLACEHOLDER|$fullcmd|g" /fsx-storygen/beidic/yang/submitwithcron5/lm_eval_harness_temp.sh > "$job_script"
        
        # Submit the job
        /opt/slurm/bin/sbatch "$job_script"
        
        # Optionally, remove the temporary job script
        # rm "$job_script"
    done
done

/opt/slurm/bin/squeue -u beidic
