#****************************************************************************************************
# Function Name: pullutantmean()

# Arguments: 'directory', 'pollutant', and 'id'

# Description: 
# Calculates the mean of a pollutant (sulfate or nitrate) across a specified list of monitors. 
# The function 'pollutantmean' takes three arguments: 'directory', 'pollutant', and 'id'. 
# Given a vector monitor ID numbers, 'pollutantmean' reads that monitors' particulate matter data 
# from the directory specified in the 'directory' argument and returns the mean of the pollutant 
# across all of the monitors, ignoring any missing values coded as NA.

# Author: srini-t10 (https://github.com/srini-t10)

# Version: 1.0

#****************************************************************************************************

# Begin pollutantmean funtion  ...

pollutantmean <- function(directory, pollutant, id=1:332){
      
      # Get the file list from directory
      filename <- list.files(directory)
      
      # Read pollutant value from first file
      filedata <- read.csv(paste(directory,"/",filename[id[1]],sep=""))
      fileappend <- na.omit(filedata[[pollutant]])
      
      # Append pollutant values from subsequent file
      for(i in id[-1]) {
            filedata <- read.csv(paste(directory,"/",filename[i],sep=""))
            fileappend <- c(fileappend,na.omit(filedata[[pollutant]]))
      }
      
      # Return the mean
      mean(fileappend)
      
}

# End function

#****************************************************************************************************