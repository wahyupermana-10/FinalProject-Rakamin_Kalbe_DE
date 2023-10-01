#!/bin/bash

# Define the variables
path="/hdfs/data/data1"
name_of_directory="data1"
filename_excel="daily_market_price.xlsx"
source_dir="/local/data/market"
target_dir="$path/$name_of_directory"
log_file="$target_dir/move_log.txt"

# Check if the directory exists
if [ -d "$target_dir" ]; then
    echo "Directory $name_of_directory Exists!"

    # Copy the file from the source directory to the target directory
    cp "$source_dir/$filename_excel" "$target_dir/"

    # Check if the copy operation was successful
    if [ $? -eq 0 ]; then
        echo "File Moved Successfully" > "$log_file"
        echo "File $filename_excel was successfully copied to $target_dir"
    else
        echo "Error: Failed to copy $filename_excel to $target_dir"
    fi
else
    echo "$name_of_directory Directory Not Exists!"
    # Create the directory
    mkdir -p "$target_dir"
    if [ $? -eq 0 ]; then
        echo "Created $name_of_directory Directory."
    else
        echo "Error: Failed to create $name_of_directory Directory."
        exit 1
    fi

    # Copy the file from the source directory to the newly created target directory
    cp "$source_dir/$filename_excel" "$target_dir/"

    # Check if the copy operation was successful
    if [ $? -eq 0 ]; then
        echo "File Moved Successfully" > "$log_file"
        echo "File $filename_excel was successfully copied to $target_dir"
    else
        echo "Error: Failed to copy $filename_excel to $target_dir"
    fi
fi
