library(shiny)

shinyUI(fluidPage(
        titlePanel("WORDICT!"),
        sidebarLayout(position = "left",
                sidebarPanel(
                        h2("Introduction", style = "color:skyblue"),
                        p("Welcome to WORDICT - the Shiny App to help you finish your sentence!"),
                        p("You need to enter at least one English word, and WORDICT will provide you with a English word that is most likely to follow your input!"), 
                        br(),
                        h2("Instructions", style = "color:skyblue"),
                        p("Please enter at least one English word in the textbox below."),
                        p("Press the 'WORDICT!' button to start the prediction."),
                        textInput("n", label = h3(""), "Where do you want"),
                        actionButton("WORDICT", label = "WORDICT")
                        ),
                mainPanel(
                        tabsetPanel(type = "tabs",
                                    tabPanel("WORDICT",
                                             strong("You have entered: ", style = "color:skyblue"),
                                             textOutput("nText"),
                                             br(),
                                             br(),
                                             strong("The WORDICT: ", style = "color:skyblue"),
                                             textOutput("oText")),
                                    tabPanel("How does it work? The Essentials",
                                             p("WORDICT uses the simpliest model to predict the next word given an English language input. The model is based on a corpus, a random set of texts taken from blogs, news, and tweets. To build the model, only those words and series of consecutively used words (i.e., bigrams/ trigrams/ quadgrams - two/ three/ four consecutively used words), that covered 99.9% of the corpus were used. This means that low frequency bigrams/ trigrams/ quadgrams were not included in the model."),
                                             p("WORDICT uses a simple back-off model that is explained briefly below. To give you a WORDICT, the last words (maximum: 3) of the input sentence are extracted. From these extracted words, punctuation and special characters (e.g., comma, emojis) are removed, and words transformed to lower case."),
                                             p("For example, if the input sentence is: 'I don't KNOW where I WANT', the last three words 'where I WANT' are extracted. The transformations would turn 'where I WANT' into 'where i want'."),
                                             p("If at least three words were entered, then the model starts by looking for matching quadgrams. The model will take the transformed extracted words and look for all quadgrams that start with these words. It will rank these quadgrams and return the most likely forth word. In its current form, most likely means most frequently occuring in the corpus the WORDICT model is based on. If no matching quadgrams could be found, the search is continued with trigrams and bigrams. If no matches could be located, the most frequent single word (i.e., the) is returned."),
                                             p("Using the above example, the model starts with 'where i want'. If no matching quadgram could be found, it will use 'i want' to search corpus trigrams. If this was unsuccessful too, it will take 'want' to search for a bigram match. Lastly, if that fails too, it will return 'the', which was the most frequent word of the corpus.")
                                             ))
                        
                )
        )
))