cd /fsx-storygen/beidic/yang/model_checkpoints/llama2_7b_setting3_7_d694176_162963/             
cp -r checkpoint-6500 llama27b_c4_setting3_checkpoint_6500             
cd llama27b_c4_setting3_checkpoint_6500             
rm optimizer.pt             
cd ..             
scp -r llama27b_c4_setting3_checkpoint_6500 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 
