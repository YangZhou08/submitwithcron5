cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_4_da24707_664240/             
cp -r checkpoint-2500 tinyllamasmallmodelkernelsize4setting0checkpoint_2500             
cd tinyllamasmallmodelkernelsize4setting0checkpoint_2500             
rm optimizer.pt             
cd ..             
scp -r tinyllamasmallmodelkernelsize4setting0checkpoint_2500 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 