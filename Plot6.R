# Author - Varun Bhandary
# Objective -
# 1. Read the required data files
# 2. Create logical vectors for Coal and Combustion
# 3. Make a list of SCC Codes based on the logical vectors
# 3. Subset data based on the list of SCC Codes from above steps, Aggregate data
# 4. Repeate the same for Baltimore City and LA, Add static columns of City to the Data frames
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
datasetSubLACounty <- subset(dataset, dataset$fips=="06037")

datasetSubBaltimore <- datasetSubBaltimore[datasetSubBaltimore$SCC %in% dataset_classificationCodesSCC,]
totalBaltimoreDataSet_byYear <- aggregate(Emissions ~ year, data=datasetSubBaltimore, sum)
totalBaltimoreDataSet_byYear <- mutate(totalBaltimoreDataSet_byYear, City = c("Baltimore City"))

datasetSubLACounty <- datasetSubLACounty[datasetSubLACounty$SCC %in% dataset_classificationCodesSCC,]
totalLACountyDataSet_byYear <- aggregate(Emissions ~ year, data=datasetSubLACounty, sum)
totalLACountyDataSet_byYear <- mutate(totalLACountyDataSet_byYear, City = c("Los Angeles County"))

Dataset_cityCombined <- rbind(totalBaltimoreDataSet_byYear, totalLACountyDataSet_byYear)

png(filename="./plot6.png")

print(
  ggplot(Dataset_cityCombined, aes(x=year, y=Emissions, fill = City)) +
    geom_bar(stat = "identity") +
    facet_grid(~City, scale='free_x')
)


dev.off()