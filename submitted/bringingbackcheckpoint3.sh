cd /fsx-storygen/beidic/yang/model_checkpoints/llama2_7b_setting0_7_b68b352_066456/ 
cp -r checkpoint-13500 smallmodelllama27bcheckpoint-13500 
cd smallmodelllama27bcheckpoint-13500 
rm optimizer.pt 
cd .. 
scp -r smallmodelllama27bcheckpoint-13500 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 
