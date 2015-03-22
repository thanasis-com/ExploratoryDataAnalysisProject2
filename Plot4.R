data<- readRDS("C:/Users/Thanasis/Desktop/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC<- readRDS("C:/Users/Thanasis/Desktop/exdata-data-NEI_data/Source_Classification_Code.rds")

library(plyr)

tf<-(grepl("Coal", SCC$Short.Name)&grepl("Comb", SCC$Short.Name))
sccs<-subset(SCC, tf==TRUE)
sccs<-sccs[,1]

data<-subset(data, data$SCC %in% sccs)

aggregated<-ddply(data, .(year), summarize, sum=sum(Emissions))

png(file="plot4.png")
barplot(aggregated$sum, names=aggregated$year, xlab="Year", ylab="Total Emissions", main="Emissions from coal combustion-related sources")
dev.off()


