cd /fsx-storygen/beidic/yang/model_checkpoints/tinyllama_2daf217_904574/             
cp -r checkpoint-2500 tinyllamaoneepochfinetuningc4checkpoint-2500             
cd tinyllamaoneepochfinetuningc4checkpoint-2500             
rm optimizer.pt             
cd ..             
scp -r tinyllamaoneepochfinetuningc4checkpoint-2500 zx22@terminator8.cs.rice.edu:/home/zx22/yangzho 