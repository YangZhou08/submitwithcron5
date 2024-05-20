cd /fsx-storygen/beidic/yang/model_checkpoints/llama2_7b_setting0_8_2716cec_295578/             
# cp -r checkpoint-1500 recoveringkernelsize8setting0checkpoint-1500 
# cd recoveringkernelsize8setting0checkpoint-1500 
# rm optimizer.pt 
# cd .. 
scp -r recoveringkernelsize8setting0checkpoint-1500 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 