cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_a27445c_099673/
cp -r checkpoint-6700 anothercheckpoint-6700 
cd anothercheckpoint-6700 
echo "$(pwd)" 
# rm optimizer.pt 
# cd .. 
# scp -r anothercheckpoint-6700 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho/ 
