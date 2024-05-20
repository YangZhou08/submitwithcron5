cd /fsx-storygen/beidic/yang/model_checkpoints/largemodeltinyllama_158ea1e_755673/ 
cp -r checkpoint-1100 nativecondensedlayer10checkpoint-1100 
cd nativecondensedlayer10checkpoint-1100 
rm optimizer.pt 
cd .. 
scp -r nativecondensedlayer10checkpoint-1100 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 