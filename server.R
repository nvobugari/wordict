library(shiny); library(qdap); library(RWeka); library(stringr); library(data.table)
# setwd("~/Desktop/Coursera/2014_R_Capstone/Wordict/")
# Load ngram tables.

source("./Helper.R", local = TRUE)

shinyServer(
        function(input, output) {
                withProgress(message = 'Please wait. Loading data ...', value = NULL, {
                        Sys.sleep(0.1)
                        dat <- data.frame(x = numeric(0), y = numeric(0))
                        withProgress(message = 'Initializing WORDICT', detail = "part 0", value = 0, {
                                for (i in 1:10) {
                                        dat <- rbind(dat, data.frame(x = rnorm(1), y = rnorm(1)))
                                        incProgress(0.1, detail = paste(":", i*10,"%"))
                                        Sys.sleep(0.5)
                                }
                        })
                        # Increment the top-level progress indicator
                        incProgress(0.5)
                }) 
                
                output$nText <- renderText({
                        input$WORDICT
                        isolate(input$n)
                })
                
                output$oText <- renderText({
                       input$WORDICT
                       isolate(input$n)
                       isolate(prepAndPredict(input$n))
                })
                
        }) #finalbrackets