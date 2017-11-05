
# Load required libraries
library(dplyr)
library(ggplot2)

# Create Input directory if not exists 
if(!file.exists("Input")) {dir.create("Input")}

# Download and unzip inpput files to Input directory
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
              ,"Input/input.zip" )
unzip("Input/input.zip", exdir="Input")

# Read the data
NEI <- readRDS("Input/summarySCC_PM25.rds")
SCC <- readRDS("Input/Source_Classification_Code.rds")

# Plot 3: Total PM2.5 Emissions by Type for Baltimore City vs year (1999 - 2008)

plotdata <- NEI %>% filter(fips == "24510") %>% group_by(year, type) %>% summarise(sum(Emissions))

png("plot3.png", width=900)

theme_update(plot.title = element_text(hjust = 0.5))

ggplot(plotdata,aes(x=year,y=`sum(Emissions)`)) + 
  geom_line(aes(colour=type)) + 
  geom_point(size=2, aes(colour=type)) + 
  facet_grid(.~type) + 
  labs(title="Total PM2.5 Emissions by Type for Baltimore City vs year (1999 - 2008)")

dev.off()

