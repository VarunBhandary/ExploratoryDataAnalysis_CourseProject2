# Exploratory Data Analysis Course Project 2
##This repository contains the R Code for creating the required Plots for the project work of coursera Exploratory Data Analysis Project 2.

The data files associated with the analysis are -
1. summarySCC_PM25.rds
2. Source_Classification_Code.rds

The following variables are captured as a part of the PM25 sumary data

𝚏𝚒𝚙𝚜: A five-digit number (represented as a string) indicating the U.S. county
𝚂𝙲𝙲: The name of the source as indicated by a digit string (see source code classification table)
𝙿𝚘𝚕𝚕𝚞𝚝𝚊𝚗𝚝: A string indicating the pollutant
𝙴𝚖𝚒𝚜𝚜𝚒𝚘𝚗𝚜: Amount of PM2.5 emitted, in tons
𝚝𝚢𝚙𝚎: The type of source (point, non-point, on-road, or non-road)
𝚢𝚎𝚊𝚛: The year of emissions recorded


This repository contains 6 R Codes and respective output files.
The folowing questions were tried to be answered via the R Code and Chart created
1. the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (𝚏𝚒𝚙𝚜 == "𝟸𝟺𝟻𝟷𝟶") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
3. Of the four types of sources indicated by the 𝚝𝚢𝚙𝚎 (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
4. Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
5. How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
6. Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (𝚏𝚒𝚙𝚜 == "𝟶𝟼𝟶𝟹𝟽"). Which city has seen greater changes over time in motor vehicle emissions?

Please refer the code for further commentary.
