#
library(chron)
library(shiny)

data <- read.csv("mrr.csv")
data$Time <- as.character(as.character(data$Time))
data$Time <- paste0(data$Time, ":00")
data$Time <- times(data$Time)


available <- aggregate(Available ~ Time, data, FUN=mean)
rented    <- aggregate(Rented ~ Time, data, FUN=mean)
last      <- aggregate(Last ~ Time, data, FUN=mean)
last10    <- aggregate(Last.10 ~ Time, data, FUN=mean)

df <- merge(available, rented, by.y = "Time")
df <- merge(df, last, by.y = "Time")
df <- merge(df, last10, by.y = "Time")

names(df)[5] <- "Last 10"













