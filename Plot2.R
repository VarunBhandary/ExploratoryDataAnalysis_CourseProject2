dataset <- readRDS("./Dataset/summarySCC_PM25.rds")

dataset$year <- as.factor(dataset$year)
datasetSubBaltimore <- subset(dataset, dataset$fips=="24510")
totalBaltimoreDataSet <- with(datasetSubBaltimore, tapply(Emissions, year, sum))

png(filename='plot2.png')

barplot(totalBaltimoreDataSet, names = names(totalBaltimoreDataSet), 
     xlab="Year", 
     ylab="PM2.5 Emissions (Tons)", 
     main ="PM2.5 Emissions in Baltimore from 1999 to 2008", 
     col = "darkblue")

dev.off()
