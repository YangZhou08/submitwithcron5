cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting3_2_4719818_401382/             
cp -r checkpoint-894 tinyllamafinetunedcheckpoint-894             
cd tinyllamafinetunedcheckpoint-894             
rm optimizer.pt             
cd ..             
scp -r tinyllamafinetunedcheckpoint-894 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 