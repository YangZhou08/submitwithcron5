cd /fsx-storygen/beidic/yang/c4llm_synthesized/tinyllama_topkna/ 
mv /fsx-storygen/beidic/yang/c4llm_synthesized/tinyllama_topkna/c4synthesized_file1_kernel7_7_combined.json /fsx-storygen/beidic/yang/c4llm_synthesized/tinyllama_topkna/c4synthesized_file1_kernel7_7_combined_old.json 
mv /fsx-storygen/beidic/yang/c4llm_synthesized/tinyllama_topkna/c4synthesized_file1_kernel7_7_combined_new.json /fsx-storygen/beidic/yang/c4llm_synthesized/tinyllama_topkna/c4synthesized_file1_kernel7_7_combined.json 
# head -n 256317 /fsx-storygen/beidic/yang/c4llm_synthesized/tinyllama_topkna/c4synthesized_file1_kernel7_7_combined.json > /fsx-storygen/beidic/yang/c4llm_synthesized/tinyllama_topkna/c4synthesized_file1_kernel7_7_combined_new.json 
# tail -n 100000 /fsx-storygen/beidic/yang/c4llm_synthesized/tinyllama_topkna/c4synthesized_file1_kernel7_7_combined.json > /fsx-storygen/beidic/yang/c4llm_synthesized/tinyllama_topkna/synthesized_test.json 
# /data/home/beidic/anaconda3/envs/yangllm2/bin/python /fsx-storygen/beidic/yang/submitwithcron2/split_two_dataset.py 
ls -hl 
wc -l c4synthesized_file1_kernel7_7_combined_old.json 
wc -l c4synthesized_file1_kernel7_7_combined.json 
wc -l synthesized_test.json 
