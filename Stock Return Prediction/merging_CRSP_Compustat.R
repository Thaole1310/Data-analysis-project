library(ranger)
library(dplyr)
library(tidymodels)
library(tidyverse)
library(roll)
library("sqldf")
library(tidyverse)
library(tidymodels)

crsp <- read.csv("crsp-monthly.csv")
crsp <- crsp[ !(crsp$RET %in% c("", "B", "C")), ]
crsp$PRC <- abs(crsp$PRC)
crsp$RET <- as.numeric(crsp$RET)
crsp$RETX <- as.numeric(crsp$RETX)

compustat <- read.csv("compustat2.csv")

## yearmon to merge with Compustat
to.year <- function (x) {
  x %/% 10000 - 1900
}

to.month <- function (x) {
  (x %/% 100) %% 100 - 1  
}

to.yearmon <- function (x) {
  to.year(x) * 12 + to.month(x)
}

names(compustat)[ names(compustat) == "LPERMNO" ] = "PERMNO"
dups <- duplicated(compustat[,1:3])
compustat <- compustat[!dups,]

crsp$yearmon <- to.yearmon(crsp$date)
compustat$yearmon <- to.yearmon(compustat$datadate)

crsp$MARKETCAP <- crsp$PRC * crsp$SHROUT
compustat = merge(compustat, crsp[c("PERMNO", "yearmon", "MARKETCAP")], by=c("PERMNO", "yearmon"), all.x = TRUE)
crsp$MARKETCAP <- NULL

## rename
names(compustat)[ names(compustat) == "PERMNO" ] = "PERMNO2"
names(compustat)[ names(compustat) == "yearmon" ] = "yearmon2"

merged <- sqldf("select * from crsp, compustat where crsp.PERMNO = compustat.PERMNO2 and crsp.yearmon - compustat.yearmon2 between 4 and 6 order by PERMNO, date")

merged$yearmon <- NULL
merged$yearmon2 <- NULL
merged$PERMNO2 <- NULL