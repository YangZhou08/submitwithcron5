import json
dir_path = "/fsx-storygen/beidic/yang/c4llm_synthesized/tinyllama_topkna/" # synthesized dataset path 

# Load the original JSON file
with open(dir_path + "c4synthesized_file1_kernel7_7_combined.json", "r", encoding = "utf-8") as file:
    data = json.load(file) 

# Assuming the data is a list of objects
first_part = data[:256000]
second_part = data[256000:]

# Write the first 256k objects to the original file
with open(dir_path + "c4synthesized_file1_kernel7_7_combined.json", "w", encoding = "utf-8") as file:
    json.dump(first_part, file, ensure_ascii=False, indent=4)

# Write the remaining 100k objects to a new file
with open(dir_path + "synthesized_test.json", "w", encoding = "utf-8") as file:
    json.dump(second_part, file, ensure_ascii=False, indent=4) 
