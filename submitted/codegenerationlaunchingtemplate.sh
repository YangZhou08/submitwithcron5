#!/bin/bash

models=(
    "meta-llama/Meta-Llama-3-8B-Instruct"
    # "meta-llama/Meta-Llama-3-8B"
    # "meta-llama/Llama-2-7b-chat-hf"
    "meta-llama/Llama-2-7b-hf"
) 

# List of commands to run
commands=(
    # "accelerate launch --num_processes 8 main.py --tasks humaneval --do_sample False --n_samples 1 --batch_size 1 --max_length_generation 512 --enable_epatches --allow_code_execution"
    # "accelerate launch --num_processes 8 main.py --tasks humaneval --do_sample False --griffin --n_samples 1 --batch_size 1 --max_length_generation 512 --enable_epatches --allow_code_execution"
    # "accelerate launch --num_processes 8 main.py --tasks humaneval --do_sample False --cats --n_samples 1 --batch_size 1 --max_length_generation 512 --enable_epatches --allow_code_execution"
    # "accelerate launch --num_processes 8 main.py --tasks humaneval --do_sample False --griffin --check --n_samples 1 --batch_size 1 --max_length_generation 512 --enable_epatches --allow_code_execution"
    # "accelerate launch --num_processes 8 main.py --tasks humaneval --do_sample False --cats --check --n_samples 1 --batch_size 1 --max_length_generation 512 --enable_epatches --allow_code_execution"
    # "accelerate launch --num_processes 8 main.py --tasks mbpp --do_sample False --n_samples 1 --batch_size 1 --max_length_generation 2048 --enable_epatches --allow_code_execution"
    # "accelerate launch --num_processes 8 main.py --tasks mbpp --do_sample False --griffin --n_samples 1 --batch_size 1 --max_length_generation 2048 --enable_epatches --allow_code_execution"
    # "accelerate launch --num_processes 8 main.py --tasks mbpp --do_sample False --cats --n_samples 1 --batch_size 1 --max_length_generation 2048 --enable_epatches --allow_code_execution"
    "accelerate launch --num_processes 8 main.py --tasks mbpp --do_sample False --griffin --check --n_samples 1 --batch_size 1 --max_length_generation 2048 --enable_epatches --allow_code_execution"
    "accelerate launch --num_processes 8 main.py --tasks mbpp --do_sample False --cats --check --n_samples 1 --batch_size 1 --max_length_generation 2048 --enable_epatches --allow_code_execution"
)

# Iterate over the commands and submit a job for each
for cmd in "${commands[@]}"; do
    for model in "${models[@]}"; do
        # Create a temporary job script 
        unique_id=$(date +%s%N | sha256sum | base64 | head -c 5)
        job_script=$(mktemp /fsx-storygen/beidic/yang/submitwithcron5/submitted/job-$unique_id-XXXXXX.sh)

        fullcmd="$cmd --model $model"
        
        # Fill in the placeholder in the template with the actual command
        sed "s|COMMAND_PLACEHOLDER|$fullcmd|g" /fsx-storygen/beidic/yang/submitwithcron5/code_generation_template.sh > "$job_script"
        
        # Submit the job
        /opt/slurm/bin/sbatch "$job_script"
        
        # Optionally, remove the temporary job script
        # rm "$job_script"
    done
done

/opt/slurm/bin/squeue -u beidic
