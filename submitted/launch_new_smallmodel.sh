cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting5_7_b6d7e5a_098617/ 
cp -r checkpoint-2500 autoregressive_all_known_checkpoint-2500 
cd autoregressive_all_known_checkpoint-2500 
rm optimizer.pt 
cd .. 
scp -r autoregressive_all_known_checkpoint-2500 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 
