# please specify the path to the checkpoint file 
import datetime 
hash_of_time = str(datetime.datetime.now()).split('.')[-1] 
print("the hash of time is {}".format(hash_of_time)) 

checkpoint_path = input("Does the file directory contains the newest information? y/n ") 
if checkpoint_path == "y": 
    queryf = open("bringbackerrorfiles.txt", "r") 
else: 
    exit(0) 
jobidsbringing = [] 
lines = queryf.readlines() 
for line in lines: 
    if "yangzho6" in line: 
        segs = line.split(" ") 
        jobidsbringing.append(int(segs[0])) 
print(jobidsbringing) 

file = open("./bash_tasks/bringbackerrorfiles_timehash{}.sh".format(hash_of_time), "w") 

# print(checkpoint_path) 
# print(checkpoint_folder) 
# print(namingpreference) 

# commands = "cd {} \
#             \ncp -r {} {} \
#             \ncd {} \
#             \nrm optimizer.pt \
#             \ncd .. \
#             \nscp -r {} zx22@terminator8.cs.rice.edu:/home/zx22/yangzho ".format(checkpoint_path, checkpoint_folder, namingpreference, namingpreference, namingpreference) 
commands = "" 
for jobid in jobidsbringing: 
    # commands += "mv /private/home/beidic/yang/log/log-{}.err ../submitted\n".format(jobid) 
    # commands += "mv /private/home/beidic/yang/log/log-{}.out ../submitted\n\n".format(jobid) 
    commands += "cp /fsx-storygen/beidic/yang/log/log-{}.err ../submitted\n".format(jobid) 
    commands += "cp /fsx-storygen/beidic/yang/log/log-{}.out ../submitted\n\n".format(jobid) 

file.write(commands) 
file.close() 

print() 
print(commands) 
print() 

print("The bash script has been written to ./bash_tasks/bringbackerrorfiles_timehash{}.sh".format(hash_of_time)) 
