#****************************************************************************************************
# Function Name: corr()

# Arguments: 'directory', and 'threshold'

# Description: 
# This function takes a directory of data files and a threshold for complete cases and calculates 
# the correlation between sulfate and nitrate for monitor locations where the number of completely 
# observed cases (on all variables) is greater than the threshold. The function returns a vector of 
# correlations for the monitors that meet the threshold requirement. If no monitors meet the 
# threshold requirement, then the function returns a numeric vector of length 0

# Author: srini-t10 (https://github.com/srini-t10)

# Version: 1.0

#****************************************************************************************************

# Begin corr funtion  ...

corr <- function(directory, threshold=0){
      
      # Get the file list from directory
      filename <- list.files(directory)
      
      # initialize an output vector
      output <- NULL
      
      # Get corelation for the complete cases above threshold, bind it to the same vector
      for(i in 1:length(filename)) {
            filedata <- na.omit(read.csv(paste(directory,"/",filename[i],sep="")))
            if(length(filedata$ID)>threshold) {
                  output <- c(output,cor(filedata$sulfate,filedata$nitrate))
            }
            
      }
      
      # Return the vector
      return(output)
      
}

# End function

#****************************************************************************************************