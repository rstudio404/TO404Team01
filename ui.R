#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

#citibikesample <- read.csv("samplecsv.csv")
#library("lubridate"); library("chron");library("timeDate")

#getting relevant vectors from sample data
#datafortime <- citibikesample[,c(2:4,6:8,10:13)]

#ymdhms format
#datafortime$starttime <- ymd_hms(datafortime$starttime)
#datafortime$stoptime <- ymd_hms(datafortime$stoptime)
#datafortime$roundedhour <- floor_date(datafortime$starttime, "hour")

#count number of times per usertype per hour that a start station is used
#startstationbyroundedhour <- count(datafortime, start.station.id, usertype, roundedhour)

#count number of times per usertype per hour that a end station is used
#endstationbyroundedhour <- count(datafortime, end.station.id, usertype, roundedhour)

#combine df's by station id and month
#combinedcountbyroundedhour <- merge(startstationbyroundedhour, endstationbyroundedhour, by.x = c("start.station.id","usertype","roundedhour"), by.y = c("end.station.id","usertype","roundedhour"))

#find surplus(deficit) and make a new vector
#combinedcountbyroundedhour$dif <- c(combinedcountbyroundedhour$n.y - combinedcountbyroundedhour$n.x)
combinedcountbyroundedhour <- read.csv("Rshinydynamicpricing.csv")
library(shiny)

ui <- fluidPage(
  numericInput("MinPrice", "Enter Your Minimum Price Here", 2),
  numericInput("MaxPrice", "Enter Maximum Price Here", 8), 
  plotOutput("results"),
  dataTableOutput("list")
)
  