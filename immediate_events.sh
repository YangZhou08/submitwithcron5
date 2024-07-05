echo "inside immediate_events.sh" >> /fsx-storygen/beidic/yang/submitwithcron2/submitted/my_log_file.txt 

if [ -f /fsx-storygen/beidic/yang/log/log-546297.err ]; then
    echo "File exists." >> /fsx-storygen/beidic/yang/submitwithcron2/submitted/my_log_file.txt 
else
    echo "File does not exist." >> /fsx-storygen/beidic/yang/submitwithcron2/submitted/my_log_file.txt 
fi
mv /fsx-storygen/beidic/yang/log/log-546297.err ../submitted 


