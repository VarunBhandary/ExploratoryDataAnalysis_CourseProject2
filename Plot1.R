# Author - Varun Bhandary
# Objective -
# 1. Read the required data files
# 2. Aggregate data
# 3. Generate required Plot and save to PNG output format 


dataset <- readRDS("./Dataset/summarySCC_PM25.rds")

dataset$year <- as.factor(dataset$year)

totalDataSet <- with(dataset, tapply(Emissions, year, sum))

png(filename='plot1.png')

barplot(totalDataSet, names = names(totalDataSet), 
        xlab="Year", 
        ylab="PM2.5 Emission (In Tons)", 
        col = "darkblue", 
        main = "Total emissions from PM2.5 in the US from 1999 to 2008"
        )

dev.off()
