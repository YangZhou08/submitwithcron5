cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_4_fae1ad2_674543/             
# cp -r checkpoint-900 kernelsize4tinyllamasetting0checkpoint-900 
# cd kernelsize4tinyllamasetting0checkpoint-900 
# rm optimizer.pt 
# cd .. 
scp -r kernelsize4tinyllamasetting0checkpoint-900 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 