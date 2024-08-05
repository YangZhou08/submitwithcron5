#!/bin/bash

cd /fsx-storygen/beidic/yang/GRIFFIN2
git branch 
git add .
git stash 
git pull 
git checkout yangexppp 
ls 

models=(
    "meta-llama/Meta-Llama-3-8B-Instruct" 
    "meta-llama/Meta-Llama-3-70B-Instruct" 
    # "meta-llama/Meta-Llama-3-8B"
    # "meta-llama/Llama-2-7b-chat-hf"
    # "meta-llama/Llama-2-7b-hf"
) 

# List of commands to run
commands=(
    # "python main.py --model xhf --model_args pretrained=MODEL,griffin=False,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks gsm8k_cot --batch_size 1 --limit 500 " 
    # "python main.py --model xhf --model_args pretrained=MODEL,griffin=True,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks gsm8k_cot --batch_size 1 --limit 500 " 
    # "python main.py --model xhf --model_args pretrained=MODEL,cats=True,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks gsm8k_cot --batch_size 1 --limit 500 " 
    # "python main.py --model xhf --model_args pretrained=MODEL,griffin=False,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks gsm8k_cot --batch_size 1 " 
    # "python main.py --model xhf --model_args pretrained=MODEL,griffin=True,check=True,contextlength=1500,kernel_size=16,thr=0.05 --tasks gsm8k_cot --batch_size 1 "
    # "python main.py --model xhf --model_args pretrained=MODEL,griffin=True,check=True,contextlength=1500,kernel_size=16,thr=0.1 --tasks gsm8k_cot --batch_size 1 " 
    # "python main.py --model xhf --model_args pretrained=MODEL,cats=True,check=True,contextlength=1500,kernel_size=16,thr=0.1 --tasks gsm8k_cot --batch_size 1 "
    # "python main.py --model xhf --model_args pretrained=MODEL,cats=True,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks gsm8k_cot --batch_size 1 " 
    # "python main.py --model xhf --model_args pretrained=MODEL,griffin=False,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks gsm8k --batch_size 1 " 
    # "python main.py --model xhf --model_args pretrained=MODEL,griffin=True,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks gsm8k --batch_size 1 " 
    # "python main.py --model xhf --model_args pretrained=MODEL,cats=True,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks gsm8k --batch_size 1 " 
    # "python main.py --model xhf --model_args pretrained=MODEL,griffin=False,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks mmlu_flan_cot_fewshot --batch_size 1 --limit 0.3" 
    # "python main.py --model xhf --model_args pretrained=MODEL,griffin=True,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks mmlu_flan_cot_fewshot --batch_size 1 --limit 0.3" 
    # "python main.py --model xhf --model_args pretrained=MODEL,cats=True,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks mmlu_flan_cot_fewshot --batch_size 1 --limit 0.3" 
    # "python main.py --model xhf --model_args pretrained=MODEL,griffin=False,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks truthfulqa_gen --batch_size 1 " 
    # "python main.py --model xhf --model_args pretrained=MODEL,griffin=True,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks truthfulqa_gen --batch_size 1 " 
    # "python main.py --model xhf --model_args pretrained=MODEL,cats=True,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks truthfulqa_gen --batch_size 1 " 
    # "python main.py --model xhf --model_args pretrained=MODEL,griffin=False,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks coqa --batch_size 1 " 
    # "python main.py --model xhf --model_args pretrained=MODEL,griffin=True,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks coqa --batch_size 1 " 
    # "python main.py --model xhf --model_args pretrained=MODEL,cats=True,check=False,contextlength=1500,kernel_size=16,thr=0.05 --tasks coqa --batch_size 1 " 
    "python eval_gen.py --model_name MODEL --dataset cnn" 
    "python eval_gen.py --model_name MODEL --dataset cnn --griffin" 
    "python eval_gen.py --model_name MODEL --dataset cnn --cats" 
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
        # sed "s|COMMAND_PLACEHOLDER|$fullcmd|g" /fsx-storygen/beidic/yang/submitwithcron5/lm_eval_harness_temp.sh > "$job_script" 
        sed "s|COMMAND_PLACEHOLDER|$fullcmd|g" /fsx-storygen/beidic/yang/submitwithcron5/lm_eval_harness_temp22.sh > "$job_script" 
        
        # Submit the job
        /opt/slurm/bin/sbatch "$job_script"
        
        # Optionally, remove the temporary job script
        # rm "$job_script"
    done
done

/opt/slurm/bin/squeue -u beidic
