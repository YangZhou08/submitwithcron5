cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting3_7_1f09742_316887/             
cp -r checkpoint-3000 tinyllama_c4_setting3_checkpoint-3000              
cd tinyllama_c4_setting3_checkpoint-3000              
rm optimizer.pt             
cd ..             
scp -r tinyllama_c4_setting3_checkpoint-3000  zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 