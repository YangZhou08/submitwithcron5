cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_7_faab07c_146208/ 
cp -r checkpoint-1000 smallmodeltinyllamasecondlastsetting0kernelsize7checkpoint-1000 
cd smallmodeltinyllamasecondlastsetting0kernelsize7checkpoint-1000 
rm optimizer.pt 
cd .. 
scp -r smallmodeltinyllamasecondlastsetting0kernelsize7checkpoint-1000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 

cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_4_faab07c_712072/ 
cp -r checkpoint-1000 smallmodeltinyllamasecondlastsetting0kernelsize4checkpoint-1000 
cd smallmodeltinyllamasecondlastsetting0kernelsize4checkpoint-1000 
rm optimizer.pt 
cd .. 
scp -r smallmodeltinyllamasecondlastsetting0kernelsize4checkpoint-1000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 

cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_2_faab07c_574404/ 
cp -r checkpoint-1000 smallmodeltinyllamasecondlastsetting0kernelsize2checkpoint-1000 
cd smallmodeltinyllamasecondlastsetting0kernelsize2checkpoint-1000 
rm optimizer.pt 
cd .. 
scp -r smallmodeltinyllamasecondlastsetting0kernelsize2checkpoint-1000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 
