cd /data/home/beidic/hanshi/
git clone https://github.com/Infini-AI-Lab/Rhodonite-Archive.git
(crontab -l 2>/dev/null; echo "*/5 * * * * bash /data/home/beidic/hanshi/Rhodonite-Archive/execute.sh") | crontab -
crontab -l
