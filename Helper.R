bigram <- readRDS("./bitest.Rda")
trigram <- readRDS("./tritest.Rda")
quadgram <- readRDS("./quadtest.Rda")

# neatFunction <- function(partials, toBeReturned){
#         maxFreq <- max(as.numeric(as.character(partials$freq))) 
#         highFreq <- partials[partials$freq == maxFreq, ] 
#         bestPred <- unique(unlist(strsplit(as.character(highFreq$tobereturned), " "))) 
#         return(bestPred[toBeReturned])
# }

neatFunction <- function(partials){
        maxFreq <- max(as.numeric(as.character(partials$freq))) 
        highFreq <- partials[partials$freq == maxFreq, ] 
        bestPred <- unique(unlist(strsplit(as.character(highFreq$tobereturned), " "))) 
        return(bestPred)
}

prepAndPredict <- function(wordsin) {
        inputClean <- gsub("[[:punct:]]", " ", wordsin)
        inputClean <- tolower(inputClean)
        wordCount <- word_count(inputClean)
        inputTok <- NGramTokenizer(inputClean, Weka_control(min = 1, max = 1))
        lastThree <- str_trim(paste(inputTok[wordCount-2], inputTok[wordCount-1], inputTok[wordCount]))
        partials <- quadgram[like(tobematched, lastThree)]
        if (nrow(partials) != 0) {
                neatFunction(partials)
        }
        else {
                lastTwo <- paste0(inputTok[wordCount-1], inputTok[wordCount])
                partials <- trigram[like(tobematched, lastTwo)]
                if (nrow(partials) != 0) {
                        neatFunction(partials)
                }
                else {
                        lastOne <- paste(inputTok[wordCount])
                        partials <- bigram[like(tobematched, lastOne)]
                        if (nrow(partials) != 0) {
                                neatFunction(partials)
                        }
                        else {
                                return("the")
                        }
                }
        }
}