library(ggplot2)
library(dplyr)

dataset <- readRDS("./Dataset/summarySCC_PM25.rds")
dataset_classificationCodes <- readRDS("./Dataset/Source_Classification_Code.rds")

dataset$year <- as.factor(dataset$year)
dataset$type <- as.factor(dataset$type)
dataset$Emissions <- as.numeric(dataset$Emissions)

dataset

datasetSubBaltimore <- subset(dataset, dataset$fips=="24510")

totalBaltimoreDataSet_byYearType <- aggregate(Emissions ~ year + type, data=datasetSubBaltimore, sum)

png(filename="./plot3.png")

print(
  ggplot(totalBaltimoreDataSet_byYearType, aes(x=year, y=Emissions, fill = type)) +
    geom_bar(stat = "identity") +
    facet_grid(~type, scale='free_x')
)

dev.off()