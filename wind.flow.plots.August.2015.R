###############  New windflow diagrams August 2015  ##########################

library(openair)
library(latticeExtra)

setwd("C:/QC_IP/met.2008.2013")   #QCIPNUFP3031   QCIP3031format  LGA_QCIPNUFPOCEC_full_hourly_align

FILE7 <- "QCIPNUFP3031"               ########  get QC non ufp file          ##########
NAME7=paste(FILE7,"csv",sep=".")
Data7=import(file= NAME7, file.type = "csv",
             sep = ",", header.at = 1, data.at = 2,
             date = "date",              date.format = "%m/%d/%Y %H:%M:%S", time = NULL,
             na.strings = c("", "NA"), quote = "\"")

QCstudy <- selectByDate(Data7, start = "25/6/2009", end = "15/7/2010") ### 


beginA = "1/0862009"; endA="15/07/2010" ; nameA="2009"
StudydataA <- selectByDate(Data7, start = beginA, end = endA)

colnames(StudydataA)[12] <- "ws"  #change ws.KLGA to ws
colnames(StudydataA)[14] <- "wd" # change wd.KLGA to wd

### New windflow  diagrams  August 12 2015   ######################################

timePlot(head(StudydataA, 168), pollutant = c("ch1.3031.x", "ch1.3031.y","ch2.3031.x","ch3.3031.x","ch3.3031.y"), 
         windflow = list(scale = 0.1, lwd = 2, col = "blue"), 
         lwd = 3, group = FALSE, 
         ylab = "concentration (ug/m3)")


scatterPlot(selectByDate(StudydataA, start = "8/8/2009", end = "8/8/2009"), 
            x = "date", y = "ch1.3031.x", z = "ch1.3031.y", 
            col = "increment", 
            windflow = list(scale = 0.15), 
            key.footer = "o3\n (ppb)", main = NULL, ylab = "no2 (ppb)")


timePlot(selectByDate(StudydataA, start = "8/8/2009", end = "9/8/2009"), 
         pollutant = c("ch1.QC", "ch1.IP","ch2.QC","ch2.IP","ch3.QC","ch3.IP"), 
         windflow = list(scale = 0.1, lwd = 2, col = "blue"), 
         lwd = 3, group = FALSE, y.relation="same", 
         ylab = "concentration (ug/m3)")

colnames(Data7)[12] <- "ws"  #change ws.KLGA to ws
colnames(Data7)[14] <- "wd" # change wd.KLGA to wd






polarPlot(StudydataA, pollutant = c("ch1.QC", "ch1.IP", "ch2.QC", "ch2.IP"), 
          x = "ws", wd = "wd",main= paste(nameA,beginA,"thru",endA, sep= " "),
          type = "default", key.header="", statistic = "weighted.mean", resolution = "normal")

windRose(StudydataA, ,breaks=c(0,2,4,6,8,10,20), paddle=FALSE, width=.75, pollutant ="ws",main=paste(nameA,beginA,"thru",endA), sep= " ", cols=c("cadetblue2", "cadetblue4", "chartreuse3","yellow","orange","red"), 
         statistic="prop.count", angle=22.5, offset=5, key.header="ws", key.position="right")









