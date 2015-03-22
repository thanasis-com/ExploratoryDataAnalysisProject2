data<- readRDS("C:/Users/Thanasis/Desktop/exdata-data-NEI_data/summarySCC_PM25.rds")
SCC<- readRDS("C:/Users/Thanasis/Desktop/exdata-data-NEI_data/Source_Classification_Code.rds")

library(plyr)

tf<-grepl("Mobile", SCC$EI.Sector)
sccs<-subset(SCC, tf==TRUE)
sccs<-sccs[,1]

data<-subset(data, (fips == "24510")|(fips=="06037"))
data<-subset(data, data$SCC %in% sccs)

aggregated<-ddply(data, .(year, fips ), summarize, sum=sum(Emissions))

aggregated$fips[aggregated$fips=="24510"] <- "Baltimore City"
aggregated$fips[aggregated$fips=="06037"] <- "Los Angeles County"

png(file="plot6.png")
p<-ggplot(aggregated, aes(x=as.factor(year), y=sum))+
  geom_histogram(binwidth=100, stat = "identity")+
  facet_wrap(~fips)+
  ylab("Total Emissions")+
  xlab("Year")+
  ggtitle("Comparison in emissions from motor vehicle sources between Baltimore City and Los Angeles County")
print(p)
dev.off()




