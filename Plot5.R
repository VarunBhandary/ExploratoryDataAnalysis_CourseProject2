# Author - Varun Bhandary
# Objective -
# 1. Read the required data files
# 2. Create logical vector for vehicle SCC Level Two containing "vehicle"
# 3. Make a list of SCC Codes based on the logical vectors
# 3. Subset data based on the list of SCC Codes from above steps, Aggregate data
# 4. Generate required Plot and save to PNG output format 

library(ggplot2)
library(dplyr)

dataset <- readRDS("./Dataset/summarySCC_PM25.rds")
dataset_classificationCodes <- readRDS("./Dataset/Source_Classification_Code.rds")

dataset$year <- as.factor(dataset$year)
dataset$type <- as.factor(dataset$type)
dataset$Emissions <- as.numeric(dataset$Emissions)

vehicleSCCRelated <- grepl("vehicle", dataset_classificationCodes$SCC.Level.Two, ignore.case = TRUE)
dataset_classificationCodesSCC <- dataset_classificationCodes[vehicleSCCRelated,"SCC"]

datasetSubBaltimore <- subset(dataset, dataset$fips=="24510")
datasetSubBaltimore <- datasetSubBaltimore[datasetSubBaltimore$SCC %in% dataset_classificationCodesSCC,]
totalBaltimoreDataSet_byYear <- aggregate(Emissions ~ year, data=datasetSubBaltimore, sum)

png(filename="./plot5.png")

barplot(names = totalBaltimoreDataSet_byYear$year,totalBaltimoreDataSet_byYear$Emissions, 
        xlab="Year", 
        ylab="PM2.5 Emissions (Tons)", 
        main ="PM2.5 Motor Vehicle Emissions in Baltimore from 1999 to 2008", 
        col = "darkblue")


dev.off()