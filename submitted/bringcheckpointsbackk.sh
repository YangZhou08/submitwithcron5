cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_7_c00cdd4_566547/ 
cp -r checkpoint-1000 smallmodeliterativesimulationsetting0checkpoint-1000 
cd smallmodeliterativesimulationsetting0checkpoint-1000 
rm optimizer.pt 
cd .. 
scp -r smallmodeliterativesimulationsetting0checkpoint-1000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 

cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_7_c00cdd4_106162/ 
cp -r checkpoint-1000 smallmodellineariterativesimulationsetting0checkpoint-1000 
cd smallmodellineariterativesimulationsetting0checkpoint-1000 
rm optimizer.pt 
cd .. 
scp -r smallmodellineariterativesimulationsetting0checkpoint-1000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 

# cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_7_faab07c_670463/ 
# cp -r checkpoint-1000 smallmodeltinyllamasetting0kernelsize2c4checkpoint-1000 
# cd smallmodeltinyllamasetting0kernelsize2c4checkpoint-1000 
# rm optimizer.pt 
# cd .. 
# mv smallmodeltinyllamasetting0kernelsize2c4checkpoint-1000 smallmodeltinyllamasetting0kernelsize7c4checkpoint-1000 
# ls 
# scp -r smallmodeltinyllamasetting0kernelsize7c4checkpoint-1000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 
