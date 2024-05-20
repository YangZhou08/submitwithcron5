cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_4_47b6612_078448/             
cp -r checkpoint-900 tinyllamakernelsize4setting3checkpoint_900             
cd tinyllamakernelsize4setting3checkpoint_900             
rm optimizer.pt             
cd ..             
scp -r tinyllamakernelsize4setting3checkpoint_900 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 