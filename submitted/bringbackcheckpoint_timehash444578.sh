cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_2_e7b7704_912704/             
cp -r checkpoint-3000 tinyllamasmallmodelkernelsize2setting0checkpoint-3000             
cd tinyllamasmallmodelkernelsize2setting0checkpoint-3000             
rm optimizer.pt             
cd ..             
scp -r tinyllamasmallmodelkernelsize2setting0checkpoint-3000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 