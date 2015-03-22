data<- readRDS("C:/Users/Thanasis/Desktop/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC<- readRDS("C:/Users/Thanasis/Desktop/exdata-data-NEI_data/Source_Classification_Code.rds")

library(plyr)

aggregated<-ddply(data, .(year), summarize, sum=sum(Emissions))

png(file="plot1.png")
barplot(aggregated$sum, names=aggregated$year, xlab="Year", ylab="Total Emissions")
dev.off()















