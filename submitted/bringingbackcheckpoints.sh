cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_7_476b142_729542/ 
cp -r checkpoint-4000 finetuningcheckpoint-4000 
cd finetuningcheckpoint-4000 
rm optimizer.pt 
cd ..
scp -r finetuningcheckpoint-4000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 

# cd /fsx-storygen/beidic/yang/model_checkpoints/largemodeltinyllama_33a9674_934048/ 
# cp -r checkpoint-3200 kernelsize4checkpoint-3200 
# cd kernelsize4checkpoint-3200 
# rm optimizer.pt 
# cd .. 
# scp -r kernelsize4checkpoint-3200 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 

# cd /fsx-storygen/beidic/yang/model_checkpoints/largemodeltinyllama_3fa36dc_704706/
# cp -r checkpoint-2800 kernelsize2checkpoint-2800 
# cd kernelsize2checkpoint-2800 
# rm optimizer.pt 
# cd ..
# scp -r kernelsize2checkpoint-2800 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 
