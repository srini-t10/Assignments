#****************************************************************************************************
# Function Name: complete()

# Arguments: 'directory', and 'id'

# Description: 
# This function reads a directory full of files and reports the number of completely observed cases 
# in each data file. The function should return a data frame where the first column is the name of 
# the file and the second column is the number of complete cases

# Author: srini-t10 (https://github.com/srini-t10)

# Version: 1.0

#****************************************************************************************************

# Begin complete funtion  ...

complete <- function(directory, id=1:332){
      
      # Get the file list from directory
      filename <- list.files(directory)
      
      # initialize an output data frame
      output <- NULL
      
      # Get no. of completly observed case from each file, bind it to the same data frame
      for(i in id) {
            filedata <- na.omit(read.csv(paste(directory,"/",filename[i],sep="")))
            if(length(filedata$ID)>0){
                  output <- rbind(output,aggregate(list(nobs=filedata$ID),list(id=filedata$ID),length))
            }
            
      }
      
      # Return the data frame
      return(output)
      
}

# End function

#****************************************************************************************************