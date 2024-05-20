cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting3_4_a6720d0_911665/             
cp -r checkpoint-1200 tinyllama_setting3_kernelsize4_batsiz16_checkpoint_1200             
cd tinyllama_setting3_kernelsize4_batsiz16_checkpoint_1200             
rm optimizer.pt             
cd ..             
scp -r tinyllama_setting3_kernelsize4_batsiz16_checkpoint_1200 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 