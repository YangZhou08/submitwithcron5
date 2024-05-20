mkdir /fsx-storygen/beidic/yang/c4_parts2/ 
cd /fsx-storygen/beidic/yang/c4_parts2/ 
git lfs install 
git lfs version 
GIT_LFS_SKIP_SMUDGE=1 git clone https://huggingface.co/datasets/allenai/c4 
cd c4 
for i in {00000..00055} 
do
    git lfs pull --include "en/c4-train.$i-of-01024.json.gz"
    gzip -dk "en/c4-train.$i-of-01024.json.gz" 
    mv "en/c4-train.$i-of-01024.json" "en/c4_file$i.json" 
done 
du -sh * 
ls -hl 
