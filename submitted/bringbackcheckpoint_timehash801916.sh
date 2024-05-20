cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_2_ea11d18_121319/             
cp -r checkpoint-3000 tinyllamasmallmodelkernelsize2setting0oldcheckpoint-3000             
cd tinyllamasmallmodelkernelsize2setting0oldcheckpoint-3000             
rm optimizer.pt             
cd ..             
scp -r tinyllamasmallmodelkernelsize2setting0oldcheckpoint-3000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 