#*******************************************************************************************************
# Function Name: rankall() 
#
# Arguments: 
# The function takes two argument,
# 1. outcome - one of the 3 outcome name. i.e. "heart attack", "heart failure", or "pneumonia"
# 2. num - "best", "worst", or an integer indicating the ranking
#
# Description: 
# The function reads the outcome-of-care-measures.csv file from "Hospital Compare Downloadable Database"
# and returns a 2 character vector with the name of the hospital and state that corresponds to the 
# given ranking in 30-day # mortality for the specified outcome. 
# Points to note,
# a. The hospital name is the name provided in the Hospital.Name variable. 
# b. The outcomes can be one of # "heart attack", "heart failure", or "pneumonia". 
# c. Hospitals that do not have data on a particular outcome will be excluded from the set of hospitals 
#    when deciding the rankings.
# d. If the number given by num is larger than the number of hospitals in a state, 
#    then the function will return NA for that state
# e. Handling ties. 
#    If there is a tie for the best hospital for a given outcome, then the hospital names should
#    be sorted in alphabetical order and the first hospital in that set should be chosen 
#    (i.e. if hospitals "b", "c", and "f" are tied for best, then hospital "b" should be returned).
#
# Author: srini-t10 (https://github.com/srini-t10)
#
# Version: 1.0
#
#*******************************************************************************************************

# Begin rankall() funtion ... 

rankall <- function(outcome, num="best",
                         filename=paste(getwd(),"/outcome-of-care-measures.csv",sep = "")) {
      
      # Load the required libraries
      library("tools")
      
      # Validate the input file, return error message if the file is not valid
      if(!file.exists(filename)){
            stop("Invalid Source File!\n",filename," file does not exist.\n","Pass a valid file path."
            )
      }
      
      # Read the input file, elimimate NA rows while reading
      filedata <- read.csv(filename, colClasses = "character")
      
      
      # check if a valid outcome is passed, if not exit function by returning error message.
      listofoutcome <- data.frame(outcome=c("heart attack", "heart failure","pneumonia"),
                                  index=c(11,17,23))
      
      if(length(grep(outcome,listofoutcome[,1]))==0) {
            stop("invalid outcome")
      }
      
      # Convert the 30 day mortality outcome column from character to integer
      outcomeindex <- listofoutcome[listofoutcome$outcome==outcome,2]
      suppressWarnings(filedata[,outcomeindex] <- as.numeric(filedata[,outcomeindex]))
      
      # split the data by state
      bystatedata <- split(filedata[,c(2,7,outcomeindex)], filedata[,7])
      
      # Get the row index: convert the input number into integer
      suppressWarnings(
            if(is.character(num) && num=="best") {
                  rowIndex <- 1      
            }
            else{
                  rowIndex <- as.integer(num)
            }
      )
      

      # For each state, order the data ascending by 30 day morality rate, and hospital name
      # copy the hospital at given rank to output dataframe 
      output <- NULL
      for(i in 1:length(bystatedata)) {
            
            x <- na.omit(bystatedata[[i]])
            
            # order by rate and hospital
            x <- x[order(x[,3],x[,1]),]
            
            # Update the max row index if the inputed num is "worst"
            if(is.character(num) && num=="worst") {
                  rowIndex <- nrow(x)      
            }
            
            # if now rows for the specified rank, then update the hospital as NA for that state
            value <- x[rowIndex,c(1,2)]
            if(is.na(value[[1]])) {
                  value[2] <- unique(x[,2])
            }
            
            output <- rbind(output, value)
      }
      # Set the row/column names and Return the output
      colnames(output) <- c("hospital","state")
      rownames(output) <- output[,2]
      output
      
}

# End rankall() funtion 

#****************************************************************************************************

# Test scripts ...
#
# > rDir<-"Enter the file path of R file"
# > source(paste(rDir,"rankall.R",sep = ""))
# > head(rankall("heart attack", 20), 10)
# > tail(rankall("pneumonia", "worst"), 3)
# > tail(rankall("heart failure"), 10)

#****************************************************************************************************
