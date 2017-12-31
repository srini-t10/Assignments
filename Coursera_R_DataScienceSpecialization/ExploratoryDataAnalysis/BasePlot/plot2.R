# Step 1. Load required packages
    library(lubridate)

# Step 2. Download and unzip the input files
    
    # Step 2.1. Create Input/Output directories if not present
    if(!file.exists("Input")) {dir.create("Input")} 
    if(!file.exists("Output")) {dir.create("Output")} 
    
    
    # Step 2.2. Download and unzip file to Input folder
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
                  ,"Input/ProjectInputData.zip")
    
    unzip("Input/ProjectInputData.zip"
          ,exdir = "Input")
  
    
# Step 3. Read input data and set it for plotting
    
    inputdata <- read.table("Input/household_power_consumption.txt"
                            , sep = ";"
                            , header = T)
    
    # Concatinate Date and Time fields
    inputdata$DateTime <- paste(inputdata$Date,inputdata$Time)
    
    # Convert data time fields
    inputdata$Date <- dmy(inputdata$Date)
    inputdata$Time <- hms(inputdata$Time)
    inputdata$DateTime <- dmy_hms(inputdata$DateTime)
    
    # subset Feb 1 2007, Feb 2 2007 data
    plotdata <- subset(inputdata
                       , Date %in% ymd(c("2007-02-01","2007-02-02"))
                       )
    
    # conver all factors to numeric
    cols <- names(plotdata)
    factors <- grep("factor"
                     ,sapply(plotdata[,cols],class))
    plotdata[,cols[factors]] <- sapply(plotdata[,cols[factors]]
                                       , function(x) as.numeric(as.character(x)))
    
# Step 4. Create Plot 2
    with(plotdata,
         plot(Global_active_power ~ DateTime
              ,type = "l"
              ,ylab = "Global Active Power (Kilowatts)"
              ,xlab = ""
         )
    )
    
    dev.copy(png,filename = "plot2.png")
    
    dev.off()

    