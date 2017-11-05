
# Load required libraries
library(dplyr)

# Create Input directory if not exists 
if(!file.exists("Input")) {dir.create("Input")}

# Download and unzip inpput files to Input directory
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
             ,"Input/input.zip" )
unzip("Input/input.zip", exdir="Input")

# Read the data
NEI <- readRDS("Input/summarySCC_PM25.rds")
SCC <- readRDS("Input/Source_Classification_Code.rds")

# Plot 1: Total PM2.5 Emissions vs year (1999 - 2008)
plotdata <- NEI %>% group_by(year) %>% summarise(sum(Emissions))

png("plot1.png")

with(plotdata, 
     {
       par(bg="white", col.axis="snow4", col.lab="black", col.main = "snow4", col="snow4")
       plot(`sum(Emissions)`~year, type = "l", col="black", main="Total PM2.5 Emissions (in tons) vs Year")
       points(`sum(Emissions)`~year, col="blue", pch=20)
       legend("topright", legend=year, col="blue",  pch=20, box.col = "snow4", text.col="snow4")
     }
    )

dev.off()

