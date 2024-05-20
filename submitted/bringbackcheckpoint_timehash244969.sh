cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_7_7642d20_340848/             
cp -r checkpoint-3800 smallmodelfinetuneonc4checkpoint-3800             
cd smallmodelfinetuneonc4checkpoint-3800             
rm optimizer.pt             
cd ..             
scp -r smallmodelfinetuneonc4checkpoint-3800 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 