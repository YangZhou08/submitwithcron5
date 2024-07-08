#!/bin/bash

models=(
    "meta-llama/Meta-Llama-3-8B-Instruct"
    "meta-llama/Meta-Llama-3-8B"
    "meta-llama/Llama-2-7b-chat-hf"
    "meta-llama/Llama-2-7b-hf"
) 

# List of commands to run
commands=(
    # "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --tasks csqa,strategyqa,sports,date"
    # "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --cats --tasks csqa,strategyqa,sports,date"
    # "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --cats --tasks csqa,strategyqa,sports,date --check --kernel_size 16 --spr 0.3 --thr 0.1"
    # "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --griffin --tasks csqa,strategyqa,sports,date"
    # "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --griffin --tasks csqa,strategyqa,sports,date --check --kernel_size 16 --spr 0.3 --thr 0.1"
    "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --tasks aqua --shotfive"
    "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --cats --tasks aqua --shotfive"
    "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --cats --tasks aqua --check --kernel_size 16 --spr 0.5 --thr 0.1 --shotfive --patternstrict" 
    "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --griffin --tasks aqua --shotfive"
    "accelerate launch --main_process_port 29510 --num_processes 8 --num_machines 1 main.py --griffin --tasks aqua --check --kernel_size 16 --spr 0.5 --thr 0.1 --shotfive"
)

# Iterate over the commands and submit a job for each
for cmd in "${commands[@]}"; do
    for model in "${models[@]}"; do
        # Create a temporary job script 
        unique_id=$(date +%s%N | sha256sum | base64 | head -c 5)
        job_script=$(mktemp /fsx-storygen/beidic/yang/submitwithcron5/submitted/job-$unique_id-XXXXXX.sh)

        fullcmd="$cmd --model $model"
        
        # Fill in the placeholder in the template with the actual command
        sed "s|COMMAND_PLACEHOLDER|$fullcmd|g" /fsx-storygen/beidic/yang/submitwithcron5/commonsensereasoningandmathtemp.sh > "$job_script"
        
        # Submit the job
        /opt/slurm/bin/sbatch "$job_script"
        
        # Optionally, remove the temporary job script
        # rm "$job_script"
    done
done
