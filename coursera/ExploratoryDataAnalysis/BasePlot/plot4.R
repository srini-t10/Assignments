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
    
# Step 4. Create Plot 4
    
    # open png device
    png("plot4.png")
    
    # split plot window into 2 x 2 matrix
    par(mfrow=c(2,2))
    
    # Plot row 1 column 1: Global Active Power
    with(plotdata, 
           plot(Global_active_power ~ DateTime
                ,type = "l"
                ,ylab = "Global Active Power"
                ,xlab = ""
           )
    )
    
    # Plot row 1 column 2: Voltage
    with(plotdata, 
         plot(Voltage ~ DateTime
              ,type = "l"
              ,ylab = "Voltage"
              ,xlab = "datetime"
         )
    )
    
    
    # Plot row 2 column 1: Energy sub metering
    with(plotdata, 
          {
              # sub metering 1 line plot 
              plot(Sub_metering_1 ~ DateTime
                  ,type = "l"
                  ,ylab = "Energy sub metering"
                  ,xlab = ""
                  )
              
              # add sub metering 2 line plot 
              lines(Sub_metering_2 ~ DateTime
                    ,col = "red")
              
              # add sub metering 3 line plot 
              lines(Sub_metering_3 ~ DateTime
                    ,col = "blue")
              
              # add legend
              legend("topright"
                     ,legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
                     ,col = c("black","red","blue")
                     ,lty = c(1,1,1)
                     ,bty = "n"
                     )
          }
    )
    
    # Plot row 2 column 2: Voltage
    with(plotdata, 
         plot(Global_reactive_power ~ DateTime
              ,type = "l"
              ,ylab = "Global_reactive_power"
              ,xlab = "datetime"
         )
    )
    
    # turn off png device and switch back to screen monitor
    dev.off()

    