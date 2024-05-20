cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_7_d694176_735981/             
cp -r checkpoint-3000 tinyllama_c4_setting0_checkpoint_3000             
cd tinyllama_c4_setting0_checkpoint_3000             
rm optimizer.pt             
cd ..             
scp -r tinyllama_c4_setting0_checkpoint_3000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 