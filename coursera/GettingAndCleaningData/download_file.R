# Step 1. Download and unzip the input files

    # Step 1.1. Create Input/Output directories if not present
    if(!file.exists("Input")) {dir.create("Input")} 
    if(!file.exists("Output")) {dir.create("Output")} 
    
    
    # Step 1.2. Download and unzip file to Input folder
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
                  ,"Input/ProjectInputData.zip")
    
    unzip("Input/ProjectInputData.zip"
          ,exdir = "Input")
