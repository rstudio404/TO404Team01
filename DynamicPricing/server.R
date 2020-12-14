#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#
combinedcountbyroundedhour <- read.csv("Rshinydynamicpricing.csv")
library(shiny)
library(ggplot2)

shinyServer(function(input, output) {
   
  pricing <- reactive({
    
    combinedcountbyroundedhour$pricing <- ifelse(input$MaxPrice*(1-pnorm(combinedcountbyroundedhour$dif, mean(combinedcountbyroundedhour$dif, na.rm = TRUE), sd(combinedcountbyroundedhour$dif, na.rm = TRUE))) < input$MinPrice, input$MinPrice,input$MaxPrice*(1-pnorm(combinedcountbyroundedhour$dif, mean(combinedcountbyroundedhour$dif, na.rm = TRUE), sd(combinedcountbyroundedhour$dif, na.rm = TRUE))))
    
  })
  
  #specify output plot - shows line graph of surplus(deficit) to pricing reactive variable
  output$results <- renderPlot({
    ggplot(combinedcountbyroundedhour,aes(x=dif, y=pricing()))+geom_line(color = "darkgreen")
  })
  
  #specify output data table - shows pricing for changing price inputs
  output$list <- renderDataTable({
    cbind(pricing(), combinedcountbyroundedhour)
    
  })
})
  

