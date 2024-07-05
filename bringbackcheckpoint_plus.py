# please specify the path to the checkpoint file 
import datetime 
hash_of_time = str(datetime.datetime.now()).split('.')[-1] 
print("the hash of time is {}".format(hash_of_time)) 

checkpoint_path = input("What is the path to the checkpoint folder? ") 
checkpoint_folder = input("What is the specific name for the checkpoint? ") 
namingpreference = input("What is the prefered naming for the new folder? ") 
file = open("./bash_tasks/bringbackcheckpoint_timehash{}.sh".format(hash_of_time), "w") 

# print(checkpoint_path) 
# print(checkpoint_folder) 
# print(namingpreference) 

commands = "cd {} \
            \ncp -r {} {} \
            \ncd {} \
            \nrm optimizer.pt \
            \ncd .. \
            \nscp -r {} zx22@terminator8.cs.rice.edu:/home/zx22/yangzho ".format(checkpoint_path, checkpoint_folder, namingpreference, namingpreference, namingpreference) 

file.write(commands) 
file.close() 

print() 
print(commands) 
print() 

print("The bash script has been written to ./bash_tasks/bringbackcheckpoint_timehash{}.sh".format(hash_of_time)) 
print("Once the checkpoint is transferred (copied to intermediate device), run the following command to bring it back to local machine: ") 
print("scp -r zx22@terminator8.cs.rice.edu:/home/zx22/yangzho/{} /home/yangzho6/model_checkpoints/".format(namingpreference)) 
