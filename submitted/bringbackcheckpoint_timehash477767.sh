cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_7_d694176_869805/             
cp -r checkpoint-3000 smallmodeltinyllamakernelsize7checkpoint-3000             
cd smallmodeltinyllamakernelsize7checkpoint-3000             
rm optimizer.pt             
cd ..             
scp -r smallmodeltinyllamakernelsize7checkpoint-3000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 