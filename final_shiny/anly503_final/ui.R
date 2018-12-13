#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
df <- read.csv("data//google_cleaned.csv")
df <- df[df$Type == 'Paid',]
df = df[df$Price <= 15 ,c('Reviews', 'Rating', 'Category', 'Content.Rating', 'Price')]


fluidPage(
  
  titlePanel("Google Play Store App Explorer"),
  
  sidebarPanel(
    
    sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(df),
                value=min(1000, nrow(df)), step=500, round=0),
    
    selectInput('x', 'X', names(df)),
    selectInput('y', 'Y', names(df), names(df)[[2]]),
    selectInput('color', 'Color', c('None', names(df))),
    
    checkboxInput('jitter', 'Jitter'),
    checkboxInput('smooth', 'Smooth'),
    
    selectInput('facet_row', 'Facet Row', c(None='.', names(df))),
    selectInput('facet_col', 'Facet Column', c(None='.', names(df)))
  ),
  
  mainPanel(
    plotOutput('plot')
  )
)
