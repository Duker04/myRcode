#############                   9-28-2017  ##################
###    A newer way to get the minute averages--using aggregate()



library(openair)
library(data.table)
library(ggmap)
library("colorspace")
library(RColorBrewer)
library("MASS")
library(latticeExtra)
library(tools)
setwd("C:/My.library/10-20-17/EEPS")

setwd("C:/My.library/7-26-2017")
newFile <- file.choose()

Data1=import(newFile, file.type = "csv",
             sep = ",", header.at = 1, data.at = 2,
             date = "date",              date.format = "%m/%d/%Y %H:%M:%S", time = NULL,
             na.strings = c("", "NA"), quote = "\"")

str(Data1)


one.min=aggregate(Data1, list(OneMin = cut(Data1$date, "1 mins")), mean)


write.csv(one.min, file = "December17.traffic_1_min.csv", row.names=FALSE)







# Data1$CPC= as.numeric(as.integer(Data1$CPC))
# 
# 
# 
# 
# aggregate(list(temperature = Data1$CPC), 
#           list(hourofday = cut(Data1$date, "1 hour")), 
#           mean)
# aggregate(list(temperature = Data1$CPC), 
#           list(minuteofday = cut(Data1$date, "1 minute")), 
#           mean)
# aggregate(Data1["CPC"], list(fiveMin = cut(Data1$date, "5 mins")), 
#           mean)
# aggregate(Data1["CPC"], list(fiveMin = cut(Data1$date, "1 mins")), 
#           mean)
# 
# five=na.omit(Data1)##  Because the NA's create an issue 
# aggregate(five[c("CPC","LDSA")], list(fiveMin = cut(five$date, "1 mins")), 
#           mean)




# I used this format on the last compare..
five=na.omit(Data1)##  Because the NA's create an issue 
Minave=aggregate(five[c("CPC4.3rd","LDSA.3rd", "PUFP.3rd","ws.3rd", "wd.3rd", "temp.3rd", "rh.3rd", "mb.3rd")], list(fiveMin = cut(five$date, "1 mins")), 
                 mean)

Minave=aggregate(five[c("CPC.SE","LDSA.SE", "PUFP.SE","ws.SE", "wd.SE", "temp.SE", "rh.SE", "mb.SE")], list(fiveMin = cut(five$date, "1 mins")), 
                 mean)



write.csv(Minave, file = "10182017.SE.min.ave.csv", row.names=FALSE)



