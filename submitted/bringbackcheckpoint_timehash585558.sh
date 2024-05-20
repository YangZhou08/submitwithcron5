cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_4_e7b7704_141609/             
cp -r checkpoint-3000 tinyllamasmallkernelsize2setting0checkpoint-3000             
cd tinyllamasmallkernelsize2setting0checkpoint-3000             
rm optimizer.pt             
cd ..             
scp -r tinyllamasmallkernelsize2setting0checkpoint-3000 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 