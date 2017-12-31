
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

# Plot 6: Total PM2.5 Emissions for motor vehicle sources in Baltimore City & Los Angeles County vs year (1999 - 2008)

SCC_vehicle <- SCC[grepl("[Vv]ehicle",SCC$EI.Sector),]  
plotdata6 <- NEI %>% filter(fips %in% c("24510", "06037")) %>% inner_join(SCC_vehicle, by = c("SCC"="SCC"))  %>% group_by(fips,year) %>% summarise(sum(Emissions))

plotdata6$fips <- gsub("24510","Baltimore City",plotdata6$fips)
plotdata6$fips <- gsub("06037","Los Angeles County",plotdata6$fips)


png("plot6.png", width=900)

theme_update(plot.title = element_text(hjust = 0.5))

ggplot(plotdata6,aes(x=year,y=`sum(Emissions)`)) + 
  geom_line(aes(colour=fips)) + 
  geom_point(size=2,aes(colour=fips)) +
  facet_grid(.~fips) +
  labs(title="Total PM2.5 Emissions for motor vehicle sources in Baltimore City & Los Angeles County vs year (1999 - 2008)") 

dev.off()

