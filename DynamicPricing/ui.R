#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
combinedcountbyroundedhour <- read.csv("Rshinydynamicpricing.csv")
library(shiny)

ui <- fluidPage(
  numericInput("MinPrice", "Enter Your Minimum Price Here", 2),
  numericInput("MaxPrice", "Enter Maximum Price Here", 8), 
  plotOutput("results"),
  dataTableOutput("list")
)
  