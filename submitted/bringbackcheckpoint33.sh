cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting5_4_faab07c_195475/ 
cp -r checkpoint-1000 smallmodeltinyllamasetting5kernelsize4checkpoint-1000 
cd smallmodeltinyllamasetting5kernelsize4checkpoint-1000 
rm optimizer.pt 
cd .. 
scp -r smallmodeltinyllamasetting5kernelsize4checkpoint-1000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 

cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting5_2_faab07c_299842/ 
cp -r checkpoint-1000 smallmodeltinyllamasetting5kernelsize2checkpoint-1000 
cd smallmodeltinyllamasetting5kernelsize2checkpoint-1000 
rm optimizer.pt 
cd .. 
scp -r smallmodeltinyllamasetting5kernelsize2checkpoint-1000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 

cd /fsx-storygen/beidic/yang/model_checkpoints/llama2_7b_setting0_2_faab07c_615090/ 
cp -r checkpoint-1000 smallmodelllama27bsetting0kernelsize2checkpoint-1000 
cd smallmodelllama27bsetting0kernelsize2checkpoint-1000 
rm optimizer.pt 
cd .. 
scp -r smallmodelllama27bsetting0kernelsize2checkpoint-1000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 
