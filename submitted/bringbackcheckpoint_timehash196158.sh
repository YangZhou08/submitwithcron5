cd /fsx-storygen/beidic/yang/model_checkpoints/llama2_7b_setting0_4_9389c5e_398043/             
cp -r checkpoint-750 recoveringmodekernelsize4setting0checkpoint-750             
cd recoveringmodekernelsize4setting0checkpoint-750             
rm optimizer.pt             
cd ..             
scp -r recoveringmodekernelsize4setting0checkpoint-750 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 