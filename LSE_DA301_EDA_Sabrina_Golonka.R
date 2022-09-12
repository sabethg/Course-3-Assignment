install.packages('IRkernel')


install.packages('tidyverse')
library('tidyverse')

turtle_sales<-read.csv(file='turtle_sales.csv', header=TRUE)
dim(turtle_sales)
head(turtle_sales,n=5)

turtle_sales$Ranking<-NULL
turtle_sales$Year<-NULL
turtle_sales$Genre<-NULL
turtle_sales$Publisher<-NULL

summary(turtle_sales)


View(turtle_sales)

qplot(NA_Sales,data=turtle_sales,geom='histogram')
qplot(EU_Sales,data=turtle_sales,geom='histogram')
qplot(Global_Sales,data=turtle_sales,geom='histogram', binwidth=2.5)

prop_sales<-mutate(turtle_sales,NA_Sales/Global_Sales,EU_Sales/Global_Sales)
view(prop_sales)

prop_sales<-rename(prop_sales,NorthAm=NA_Sales)
prop_sales<-rename(prop_sales,Europe=EU_Sales)


tapply(turtle_sales$Global_Sales,turtle_sales$Platform,summary)


wii_sales<-filter(prop_sales, Platform=='Wii')
GB_sales<-filter(prop_sales,Platform=='GB')
DS_sales<-filter(prop_sales,Platform=='DS')
NES_sales<-filter(prop_sales,Platform=='NES')

qplot(Global_Sales,data=wii_sales, geom='histogram')
qplot(Global_Sales,data=DS_sales,geom='histogram')
qplot(Global_Sales,data=GB_sales,geom='histogram')
qplot(Global_Sales,data=NES_sales,geom='histogram')


qplot(NA_Sales/Global_Sales,data=wii_sales, geom='histogram')
qplot(NA_Sales/Global_Sales,data=DS_sales,geom='histogram')
qplot(NA_Sales/Global_Sales,data=GB_sales,geom='histogram')
qplot(NA_Sales/Global_Sales,data=NES_sales,geom='histogram')

var(wii_sales$NA_Sales/Global_Sales)

top_platforms<-rbind(wii_sales,DS_sales,GB_sales,NES_sales)
View(top_platforms)

qplot(NA_Sales/Global_Sales,fill=Platform, data=top_platforms,geom='histogram', binwidth=.05)

#df <- sales %>% group_by(Product) %>% summarise(across(.cols = c(NA_Sales, EU_Sales, Global_Sales), list(sum = sum)))

View(turtle_sales)
