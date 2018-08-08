---
title: Tidy data set column details
output: html_document
---

## The below table describes in details the names, class and description of each of the column of the tidy data set.



```{r echo=FALSE}
mypath <- getwd()
library(knitr)
source("run_analysis.R")
ColNames <- names(tidy_mean_std_col_data)
ColNames <- gsub("Freq", "Frequency", ColNames)
ColNames <- gsub("\\."," ",ColNames)
contents <- function(x){
        data.frame(Class=sapply(x,class))
        }
contentSummary <- function(x){
        data.frame(sapply(x,summary))
        }

tidy_details <- contents(tidy_mean_std_col_data)
tidy_details$Description <- ColNames
tidy_details1 <- contentSummary(tidy_mean_std_col_data)
setwd(mypath)
```
```{r echo=FALSE, results='asis'}
kable(tidy_details)
```

