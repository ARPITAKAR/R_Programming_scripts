#Data Cleaning and Data Handaling with R
# How Data Looks
Data=read.csv("Salary.csv")
dim(Data)
summary(Data)
brief(Data)
str(Data)
head(Data)
colnames(Data)
#CHANGING COLUMNS NAMES
colnames(Data)[1]="Name"
colnames(Data)[2:4]=c("Title","ID","AgencyName")
colnames(Data)
#### Cleaning The Observations in DataFrame
x=c(0,NA,3,4,5,-3,-6,7)
x
x>2
is.na(NA)
x>2 & !is.na(x)
(x==0 | x>2)
(x==0 | x>2) & !is.na(x)
Data_1=Data
Data_1[1000,5]=NA
Data_1[3000,2]=NA
Data_1[4000,3]=NA

sum(is.na(Data))
sum(is.na(Data_1))
all(!is.na(Data_1))

# Changing all NA to zero
Data_1[is.na(Data_1)]=0
sum(is.na(Data_1))
all(!is.na(Data_1))

#############
DF=data.frame(a=c(NA,1,2),b=c("One",NA,"Three"))
subset(DF,!is.na(a))
subset(DF,complete.cases(DF))
na.omit()


############
library(car)
head(Freedman)
str(Freedman)
summary(Freedman)
rm(Freedman)

median(Freedman$density)
median(Freedman$density,na.rm=TRUE)


mean(Freedman$density)
mean(Freedman$density,na.rm=TRUE)

#Remove whole row if single NA in a Row
Freedman.good=na.omit(Freedman)
summary(Freedman)

Freedman_notav=Freedman[!complete.cases(Freedman),]
Freedman_notav




######################################
install.packages("UsingR")
library(UsingR)
x=babies$dwt
summary(x)
x[x==999]=NA
range(x)
summary(x)
range(x,na.rm=T)





################################
Data_2=Data
dim(Data_2)

Data_3=rbind.data.frame(Data_2,Data_2[1:500,])
dim(Data_3)






Data_4=unique(Data_3)
dim(Data_4)
##################

head(iris)
iris[c(4:11),c(3:5)]


iris$Peta.ratio=iris$Petal.Length/iris$Petal.Width
iris$Separatio=iris$Sepal.Length/iris$Sepal.Width
head(iris)




##########

iris[iris$Petal.Width>0.5  & iris$Species=="setosa"]
subset(iris,Petal.Width>0.5 & Species=="setosa")

summarise(iris,Petal.Length.mean=mean(Petal.Length),
          Sepal.Length.mean=mean(Sepal.Length),
          Petal.Length.sd=sd(Petal.Length),
          Sepal.Length.sd=sd(Sepal.Length))



dim(Davis)
head(Davis)
output=data.frame(matrix(nrow=dim(Davis)[1],ncol=dim(Davis)[2]))
dim(output)
head(output)
colnames(output)=c("Gender","Wt","Ht","Repwt","Repht")
head(output)
output$Gender=Davis$sex
output$Wt=Davis$weight
output$Ht=Davis$height
output$Repwt=Davis$repwt
output$Repht=Davis$repht
head(output)


head(Cars93)
d=Cars93[1:3,1:4]
str(d)
summary(d)
d[3,4]=NA
d[1,1]=NA
d
d[3,c(2,4)]=list("A3",40)
class(d$Model)
levels(d$Model)
# Removing All unused Levls
d$Model=droplevels(d$Model)


levels(d$Model)


#### Adding Levles
levels(d$Model)=c(levels(d$Model),c("A3","A4","Q8"))
levels(d$Model)
d[3,c(2,4)]=list("Q8",40)
#ADDING NEW ROW
d[4,]=list("Audi","A4","Midsize",35)
d


# Same Adding New Row
d=rbind(d,list("Audi","A4","Midsize",20))
d
######## ADDING COLUMNS
d[,5]=d$Min.Price*1.4
d
colnames(d)[5]="modprice"
d
d$modprice=d$Min.Price*1.5
d




### Transform the Dataframe across long and wide formats
Speed.1=c(1441,1232,44,244,555)
Speed.2=c(1661,1432,74,344,225)
Speed.3=c(1000,1212,11,100,123)
Speed.4=c(1332,988,33,411,333)
Speed.5=c(1212,1192,55,103,771)
id=c(1,2,3,4,5)
Run=c("A","B","C","D","E")
Speed=cbind.data.frame(id,Run,Speed.1,Speed.2,Speed.3,Speed.4,Speed.5)
head(Speed)
summary(Speed)
install.packages("reshape2")
library(reshape2)
long=melt(Speed,id.vars=names(Speed)[1:2],variable.name="Speed")
head(long,10)




wide=dcast(long,id+Run ~Speed)
head(wide)



#MERGING THE DATAFRAES
V1=c("VEERZARA","Gulal","Gangs","3Idiots")
V2=c(1001,1242,3312,982)
domestic=cbind.data.frame(V1,V2)
head(domestic)
colnames(domestic)=c("Moviename","collection")
head(domestic)
T1=c("Hunger","titan","potter","Shades")
T2=c(2001,1542,1312,9982)
foreign=cbind.data.frame(T1,T2)
head(foreign)
colnames(foreign)=c("Film","Money")
Final=merge(domestic,foreign,by.x="Moviename",by.y="Film")
head(Final)
