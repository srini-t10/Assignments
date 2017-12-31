
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

# Plot 4: Total PM2.5 Emissions for coal combustion-related sources vs year (1999 - 2008)
SCC_coal <- SCC[grepl("Fuel Comb.*Coal",SCC$EI.Sector),]  
plotdata4 <- NEI %>% inner_join(SCC_coal, by = c("SCC"="SCC"))  %>% group_by(year) %>% summarise(sum(Emissions))

png("plot4.png", width = 600)

theme_update(plot.title = element_text(hjust = 0.5))

ggplot(plotdata4,aes(x=year,y=`sum(Emissions)`)) + 
  geom_line(colour=I("snow4")) + 
  geom_point(size=2,aes(colour=factor(year))) + 
  labs(title="Total PM2.5 Emissions for coal combustion-related sources vs year (1999 - 2008)")

dev.off()

