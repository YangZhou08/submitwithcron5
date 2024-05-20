cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_setting3_2_47b6612_887072/             
cp -r checkpoint-900 tinyllamafinetunedkernelsize2checkpoint-900             
cd tinyllamafinetunedkernelsize2checkpoint-900             
rm optimizer.pt             
cd ..             
scp -r tinyllamafinetunedkernelsize2checkpoint-900 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 