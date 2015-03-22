data<- readRDS("C:/Users/Thanasis/Desktop/exdata-data-NEI_data/summarySCC_PM25.rds")

library(ggplot2)
library(plyr)

baltimore<-subset(data, fips == "24510")

baltimoreAgr<-aggregated<-ddply(baltimore, .(year, type), summarize, sum=sum(Emissions))

png(file="plot3.png")
p<-ggplot(baltimoreAgr, aes(x=as.factor(year), y=sum))+
  geom_histogram(binwidth=100, stat = "identity")+
  facet_wrap(~type)+
  ylab("Total Emissions")+
  xlab("Year")+
  ggtitle("Types of sources of PM2.5 in Baltimore City (1999-2008)")
print(p)
dev.off()