cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting0_7_d93d963_861993/             
cp -r checkpoint-2500 smallmodeltinyllamamixedkernelsizecheckpoint-2500             
cd smallmodeltinyllamamixedkernelsizecheckpoint-2500             
rm optimizer.pt             
cd ..             
scp -r smallmodeltinyllamamixedkernelsizecheckpoint-2500 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 