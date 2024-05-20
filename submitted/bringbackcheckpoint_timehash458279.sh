cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_2_a2ea41b_017949/             
# cp -r checkpoint-900 kernelsize2tinyllamasetting0checkpoint-900             
# cd kernelsize2tinyllamasetting0checkpoint-900 
# rm optimizer.pt 
# cd .. 
scp -r kernelsize2tinyllamasetting0checkpoint-900 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 