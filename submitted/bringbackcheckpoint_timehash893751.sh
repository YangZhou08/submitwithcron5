cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting3_2_79b7bd5_274623/             
cp -r checkpoint-1900 tinyllama_setting3_kernelsize2_2_checkpoint-1900             
cd tinyllama_setting3_kernelsize2_2_checkpoint-1900             
rm optimizer.pt             
cd ..             
scp -r tinyllama_setting3_kernelsize2_2_checkpoint-1900 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 