# Author - Varun Bhandary
# Objective -
# 1. Read the required data files
# 2. Create logical vectors for Coal and Combustion
# 3. Make a list of SCC Codes based on the logical vectors
# 3. Subset data based on the list of SCC Codes from above steps, Aggregate data
# 4. Generate required Plot and save to PNG output format 

library(ggplot2)
library(dplyr)

dataset_factData <- readRDS("./Dataset/summarySCC_PM25.rds")
dataset_classificationCodes <- readRDS("./Dataset/Source_Classification_Code.rds")

dataset <- merge(dataset_factData, dataset_classificationCodes, by = c("SCC","SCC"))

combustionRelated <- grepl("comb", dataset_classificationCodes[, "SCC.Level.One"], ignore.case=TRUE)
coalRelated <- grepl("coal", dataset_classificationCodes[, "SCC.Level.Four"], ignore.case=TRUE) 
coalCombustionSCC <- dataset_classificationCodes[combustionRelated & coalRelated, "SCC"]

dataset_coalcombustion <- dataset[dataset[,"SCC"] %in% coalCombustionSCC,]

totaldataset_coalcombustion <- aggregate(Emissions ~ year, data=dataset_coalcombustion, sum)


png(filename="./plot4.png")

print(
  
  barplot(totaldataset_coalcombustion$Emissions, totaldataset_coalcombustion$year, 
          xlab="Year", 
          ylab="PM2.5 Emission (In Tons)", 
          col = "darkblue", 
          main = "Total emissions from PM2.5 from combustion of Coal in the US from 1999 to 2008"
  )
)

dev.off()