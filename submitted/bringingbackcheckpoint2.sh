cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_7_145a68c_279885/ 
cp -r checkpoint-8000 smallmodeldatacompensationkernelsize7checkpoint-8000 
cd smallmodeldatacompensationkernelsize7checkpoint-8000 
rm optimizer.pt 
cd .. 
scp -r smallmodeldatacompensationkernelsize7checkpoint-8000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 

cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_7_5ca5fd3_040560/ 
cp -r checkpoint-8000 smallmodeldatacompensationkernelsize7nrow2checkpoint-8000 
cd smallmodeldatacompensationkernelsize7nrow2checkpoint-8000 
rm optimizer.pt 
cd .. 
scp -r smallmodeldatacompensationkernelsize7nrow2checkpoint-8000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 

cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_4_5ca5fd3_904640/ 
cp -r checkpoint-4000 smallmodeldatacompensationkernelsize4nrow2checkpoint-4000 
cd smallmodeldatacompensationkernelsize4nrow2checkpoint-4000 
rm optimizer.pt 
cd .. 
scp -r smallmodeldatacompensationkernelsize4nrow2checkpoint-4000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 

cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_2_5ca5fd3_179048/ 
cp -r checkpoint-2500 smallmodeldatacompensationkernelsize2nrow2checkpoint-2500 
cd smallmodeldatacompensationkernelsize2nrow2checkpoint-2500 
rm optimizer.pt 
cd .. 
scp -r smallmodeldatacompensationkernelsize2nrow2checkpoint-2500 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 

# cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_5_e96b757_585990/ 
# cp -r checkpoint-1000 smallmodelkernelsize5setting0checkpoint-1000 
# cd smallmodelkernelsize5setting0checkpoint-1000 
# rm optimizer.pt 
# cd .. 
# scp -r smallmodelkernelsize5setting0checkpoint-1000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 

# cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting3_5_e96b757_827595/ 
# cp -r checkpoint-1000 smallmodelkernelsize5setting3checkpoint-1000 
# cd smallmodelkernelsize5setting3checkpoint-1000 
# rm optimizer.pt 
# cd .. 
# scp -r smallmodelkernelsize5setting3checkpoint-1000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 
