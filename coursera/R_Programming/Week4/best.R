#*******************************************************************************************************
# Function Name: best() 
#
# Arguments: 
# The function takes two argument,
# 1. state - 2-character abbreviated name of a state
# 2. outcome - one of the 3 outcome name. i.e. "heart attack", "heart failure", or "pneumonia"
# 
#
# Description: 
# The function reads the outcome-of-care-measures.csv file from "Hospital Compare Downloadable Database"
# and returns a character vector with the name of the hospital that has the best (i.e. lowest) 30-day 
# mortality for the specified outcome in that state. 
# Points to note,
# a. The hospital name is the name provided in the Hospital.Name variable. 
# b. The outcomes can be one of # "heart attack", "heart failure", or "pneumonia". 
# c. Hospitals that do not have data on a particular outcome will be excluded from the set of hospitals 
#    when deciding the rankings.
# d. Handling ties. 
#    If there is a tie for the best hospital for a given outcome, then the hospital names should
#    be sorted in alphabetical order and the first hospital in that set should be chosen 
#    (i.e. if hospitals "b", "c", and "f" are tied for best, then hospital "b" should be returned).
#
# Author: srini-t10 (https://github.com/srini-t10)
#
# Version: 1.0
#
#*******************************************************************************************************

# Begin best() funtion ... 

best <- function(state, outcome, filename=paste(getwd(),"/outcome-of-care-measures.csv",sep = "")) {
      
      # Load the required libraries
      library("tools")
      
      # Validate the input file, return error message if the file is not valid
      if(!file.exists(filename)){
            stop("Invalid Source File!\n",filename," file does not exist.\n","Pass a valid file path."
                 )
      }
      
      # Read the input file, elimimate NA rows while reading
      filedata <- read.csv(filename, colClasses = "character")
      

      # check if a valid state is passed, if not exit function by returning error message.
      listofstate <- unique(filedata[,"State"])
      if(length(grep(state,listofstate))==0) {
            stop("invalid state")
      }
      
      
      # check if a valid outcome is passed, if not exit function by returning error message.
      listofoutcome <- data.frame(outcome=c("heart attack", "heart failure","pneumonia"),
                                  index=c(11,17,23))
      
      if(length(grep(outcome,listofoutcome[,1]))==0) {
            stop("invalid outcome")
      }
      
      # Convert the 30 day mortality outcome column from character to integer
      outcomeindex <- listofoutcome[listofoutcome$outcome==outcome,2]
      suppressWarnings(filedata[,outcomeindex] <- as.numeric(filedata[,outcomeindex]))
      
      # Filter the data to given state and outcome
      filterdata <- na.omit(filedata[filedata$State==state,c(2,7,outcomeindex)])
      
      # Order ascending by 30 day morality rate, and hospital name
      filterdata <- filterdata[order(filterdata[,3],filterdata[,1]),]
      
      # Return the hospital in first row (i.e. best hopital with lowest mortality)
      filterdata [1,1]

}

# End best() funtion 

#****************************************************************************************************

# Test scripts ...
#
# > rDir<-"Enter the file path of R file"
# > source(paste(rDir,"best.R",sep = ""))

#****************************************************************************************************
