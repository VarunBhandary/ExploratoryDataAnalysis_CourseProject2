## The plot1.R does the following.
##       1. Download the data from the URL
##       2. Extract the ZIP file


# Download the zipped data file from the URL and save the contents at 
# a specific location

DataZipUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
DataZipFileName <- "expDataAnalysis_courseProj2.zip"

dataPath <- "Dataset"
if (file.exists(dataPath)) {
  print(paste(c("Data path exists : "), dataPath))
} else {
  dir.create(dataPath)
}

if (!file.exists(DataZipFileName)) {
  download.file(DataZipUrl, paste("./",dataPath,"/",DataZipFileName, sep = ""), mode = "wb")
}

unzip(paste("./",dataPath,"/",DataZipFileName,sep = ""), exdir = paste("./",dataPath,"/",sep = ""))

print(paste(c("Data downloaded from the URL "), DataZipUrl))

print(paste(c("Unzipped the data to the following folder"), dataPath))
