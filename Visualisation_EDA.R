# Working_Directory
## setwd("C:/Users/Arpit/Desktop/R_data/r_scripts/Gasoline_insights")
library(readxl)
Weekly_Gasoline_prices <- read_excel("C:/Users/Arpit/Desktop/R_data/r_scripts/Weekly Gasoline prices.xls")
View(Weekly_Gasoline_prices)
head(Weekly_Gasoline_prices)
###########################

plot(Weekly_Gasoline_prices,type="l",main="Time_Series",col="red",lwd=2)

library(zoo)
### More effiecient way of plotting is with library Zoo
WGP=zoo(Weekly_Gasoline_prices$`Gasoline Prices  (Dollars per Gallon)`,
        Weekly_Gasoline_prices$Date)

## Convert to Quaterly 
wgp1=aggregate(WGP,as.yearqtr)
### MIXED PLOTS
par(mfrow=c(2,1))

plot(Weekly_Gasoline_prices,type="l",main="Time_Series",col="red",lwd=2)
plot(wgp1,type="l",main="Time_Series",col="blue",lwd=2)




########## BAR PLOTS
par(mfrow=c(1,1))
# One plot in one window
barplot(wgp1,ylab="qtrly_Prices",xlab="Date",col="Blue",main="Gasoline",
        border="red")



#### Visulizing Economic Outlook of different countries
library(readxl)
Nations <- read_excel("C:/Users/Arpit/Desktop/R_data/r_scripts/Nations.xlsx")
View(Nations)
head(Nations)
## Output Factor is avariable
Nations$Outlook=as.factor(Nations$Outlook)
levels(Nations$Outlook)
table(Nations$Outlook)
barplot(table(Nations$Outlook),main="Barplot")
barplot(table(Nations$Outlook),main="Barplot",horiz=T)
barplot(table(Nations$Outlook),main="Rating outlook",col=rainbow(3)
        ,ylab="Frequency",xlab="State",border="Blue")

legend("topleft",c("Negative","positive","Stable"),fill=rainbow(3),cex=0.9)



####Visulaizing Frequency Distribiution and Non-Frequency Distribiutions


library(readxl)
Cold_drink_data <- read_excel("C:/Users/Arpit/Desktop/R_data/r_scripts/Cold drink data.xlsx")
head(Cold_drink_data)
summary(Cold_drink_data)
head(Cold_drink_data)
table(Cold_drink_data)
soft_drink=cbind.data.frame(table(Cold_drink_data))
soft_drink
soft_drink$Relative_Freq=soft_drink$Freq/sum(soft_drink$Freq)
barplot(soft_drink$Relative_Freq,names.arg=soft_drink$soft_drink,col=c(1,2,3,4,5))
barplot(soft_drink$Relative_Freq,names.arg=soft_drink$soft_drink,col=rainbow(5),horiz=T)

paste0(round(100*soft_drink$Relative_Freq,2),"%")

legend("topright",legend=c("ck","Dck","Pep","Psi","Spr"),fill=rainbow(5),cex=1)
pie(soft_drink$Relative_Freq,labels=paste0(round(100*soft_drink$Relative_Freq,2),"%")
,main="soft_drink",col=rainbow(5))

legend("topleft",c("ck","Dck","Pep","Psi","Spr"),cex=1,fill=rainbow(5))



library(plotrix)
# 3d pie chart

pie3D(soft_drink$Relative_Freq,labels=paste0(round(100*soft_drink$Relative_Freq,2),"%")
      ,main="soft_drink",col=rainbow(5))
legend("topright",c("ck","Dck","Pep","Psi","Spr"),cex=0.7,fill=rainbow(5))



## Plotting Histogram in R

var=sample(50:100,10000,replace=T)
summary(var)


hist(var,xlab="frequency",ylab="variable",col=rainbow(20),border="green")
#### Breaks
hist(var,xlab="frequency",ylab="variable",col=rainbow(20),border="green",breaks=100)
