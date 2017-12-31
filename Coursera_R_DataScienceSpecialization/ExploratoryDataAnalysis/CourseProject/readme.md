## Exploratory Data Analysis - Final Course Assignment

### Introduction :

This folder contains the R scipts and plot images created for the Exploratory Data Analysis course project.
The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. 
The R scripts included in this fodler will download the required input files.

Address the following questions and for each question/task make a single plot. Unless specified, any plotting system in R can be used to make the plot.

1. Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
3. Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?


### List of files in the folder:

Following are the list of files present in this folder and a short description about them.

| File Name | Type | Description |
| --- | --- | --- |
| plot1.R | R | Script to generate plot 1 png file and answers question 1 |
| plot2.R | R | Script to generate plot 2 png file and answers question 2 |
| plot3.R | R | Script to generate plot 3 png file and answers question 3 |
| plot4.R | R | Script to generate plot 4 png file and answers question 4 |
| plot5.R | R | Script to generate plot 5 png file and answers question 5 |
| plot6.R | R | Script to generate plot 6 png file and answers question 6 |
| plot1.png | Image File | plot 1 png image file |
| plot2.png | Image File | plot 2 png image file |
| plot3.png | Image File | plot 3 png image file |
| plot4.png | Image File | plot 4 png image file |
| plot5.png | Image File | plot 5 png image file |
| plot6.png | Image File | plot 6 png image file |
| readme.md | Markdown | Documentation |


### How to run this project:

Following are the sequence of steps to run,

* Ensure that latest R version is installed in your machine. If not download and install it from <https://cran.r-project.org/> 

* Install the “dplyr” & "ggplot2" R packages

* Copying and running the scripts present in plot1.R, plot2.R, plot3.R, etc. will generate the respective output png image files



