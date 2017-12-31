# Step 1. Load required packages
    library(dplyr)

# Step 2. 
# Read the input files.  
# (Pre-Requsite: Input files needs to be present under input folder. Refer to README.md for details).  

    # Step 2.1. Read the X test variables from features.txt and define Y/Subject variables
        XCols <- read.table("Input/UCI HAR Dataset/features.txt"
                                  ,stringsAsFactors = T
                                  ,col.names = c("ColumnID","ColumnName"))
        YCols <- c("ActivityID")
        SubjectCols <- c("SubjectID")
        ActivityCols <- c("ActivityID","ActivityName")
        
        
    # Step 2.2. 
    # Clean up XCols. 
    # Replace "()" with blank, "-" with "_", and expand the column names
        XCols$ColumnName <- gsub("\\(\\)","",XCols$ColumnName)
        XCols$ColumnName <- gsub("-","_",XCols$ColumnName)
        XCols$ColumnName <- gsub("^t","Time",XCols$ColumnName)
        XCols$ColumnName <- gsub("^f","Frequency",XCols$ColumnName)
        XCols$ColumnName <- gsub("Acc","Acceleration",XCols$ColumnName)
        XCols$ColumnName <- gsub("Mag","Magnitude",XCols$ColumnName)
        
        
    # Step 2.3. Read activity labels
        Activity <- read.table("Input/UCI HAR Dataset/activity_labels.txt"
                               ,stringsAsFactors = T
                               ,col.names = ActivityCols)
        

    # Step 2.4. Read the test data with variables defined in step 2 as col.names
        TestDataX <- read.table("Input/UCI HAR Dataset/test/X_test.txt"
                               ,stringsAsFactors = T
                               ,col.names = XCols$ColumnName)
        
        TestSubject <- read.table("Input/UCI HAR Dataset/test/subject_test.txt"
                                  ,stringsAsFactors = T
                                  ,col.names = SubjectCols)
        
        TestDataY <- read.table("Input/UCI HAR Dataset/test/y_test.txt"
                                ,stringsAsFactors = T
                                ,col.names = YCols)
    

    # Step 2.5. Read the training data with variables defined in step 2 as col.names
        TrainDataX <- read.table("Input/UCI HAR Dataset/train/X_train.txt"
                                ,stringsAsFactors = T
                                ,col.names = XCols$ColumnName)
        
        TrainSubject <- read.table("Input/UCI HAR Dataset/train/subject_train.txt"
                                  ,stringsAsFactors = T
                                  ,col.names = SubjectCols)
        
        TrainDataY <- read.table("Input/UCI HAR Dataset/train/y_train.txt"
                                ,stringsAsFactors = T
                                ,col.names = YCols)

        
# Step 3. Merge test and train data
        
    # Step 3.1. Column bind test data
        TestData <- cbind(TestDataY,TestSubject,TestDataX)

    # Step 3.2. Column bind train data
        TrainData <- cbind(TrainDataY,TrainSubject,TrainDataX)
    
    # Step 3.3. Row bind test and train data
        OneDataSet <- rbind(TrainData,TestData)


# Step 4. Limit to only the required columns.
      
    # 4.1. 
    # Find only the mean (or) std (or) Activity (or) Subject columns
        ColIndex <- grep("_mean_|_mean$|_std_|_std$|Activity|Subject",names(OneDataSet))
        
    # 4.2. Update OneDataSet to contain only the required columns.
        OneDataSet <- OneDataSet[,ColIndex]
    
  
# Step 5. Merge Activity name to OneDataDet and return the Tidy Data set with the average of each variable for each activity and each subject
    TidyDataSet <- 
      OneDataSet %>% 
        inner_join(Activity, by = c("ActivityID" = "ActivityID")) %>% 
        group_by(ActivityID, ActivityName, SubjectID) %>%
        summarise_all(funs(mean))


# Step 6. Write the Tidy Data to a text file.
write.table(TidyDataSet,"Output/TidyDataSet.txt",row.names = F)
    
    
