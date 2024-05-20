cd /fsx-storygen/beidic/yang/model_checkpoints/llama2_7b_setting0_8_69f7a68_503187/             
cp -r checkpoint-750 recoveringmodemathkernelsize8setting0checkpoint-750             
cd recoveringmodemathkernelsize8setting0checkpoint-750             
rm optimizer.pt             
cd ..             
scp -r recoveringmodemathkernelsize8setting0checkpoint-750 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 