cd /fsx-storygen/beidic/yang/model_checkpoints/llama2_7b_setting0_4_9389c5e_398043/             
# cp -r checkpoint-1500 recoveringkernelsize4setting0checkpoint-1500 
# cd recoveringkernelsize4setting0checkpoint-1500 
# rm optimizer.pt 
# cd .. 
scp -r recoveringkernelsize4setting0checkpoint-1500 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 