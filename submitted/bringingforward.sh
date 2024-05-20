cd /fsx-storygen/beidic/yang/model_checkpoints/largemodeltinyllama_5f3af10_458124/ 
cp -r checkpoint-900 nativecondensedlayer3checkpoint-900 
cd nativecondensedlayer3checkpoint-900 
rm optimizer.pt 
cd ..
scp -r nativecondensedlayer3checkpoint-900 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 