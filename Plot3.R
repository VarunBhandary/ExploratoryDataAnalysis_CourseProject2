# Author - Varun Bhandary
# Objective -
# 1. Read the required data files
# 2. Subset data for reading only Baltimore City Data from the data frame.
# 3. Aggregate data based on Year, Type
# 4. Generate required Plot and save to PNG output format 

library(ggplot2)
library(dplyr)

dataset <- readRDS("./Dataset/summarySCC_PM25.rds")

dataset$year <- as.factor(dataset$year)
dataset$type <- as.factor(dataset$type)
dataset$Emissions <- as.numeric(dataset$Emissions)

datasetSubBaltimore <- subset(dataset, dataset$fips=="24510")

totalBaltimoreDataSet_byYearType <- aggregate(Emissions ~ year + type, data=datasetSubBaltimore, sum)

png(filename="./plot3.png")

print(
ggplot(totalBaltimoreDataSet_byYearType, aes(x=year, y=Emissions, fill = type)) +
geom_bar(stat = "identity") +
facet_grid(~type, scale='free_x')
)

dev.off()