data<- readRDS("C:/Users/Thanasis/Desktop/exdata-data-NEI_data/summarySCC_PM25.rds")

subData<-subset(data, fips == "24510")

library(plyr)

aggregated<-ddply(subData, .(year), summarize, sum=sum(Emissions))

png(file="plot2.png")
barplot(aggregated$sum, names=aggregated$year, xlab="Year", ylab="Total Emissions", main="Emissions from PM2.5 in Baltimore City")
dev.off()