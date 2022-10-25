# googledrive-to-rmd-example
A brief example showing how to integrate Google docs and Rmd to make reports, etc. This particular example is built to knit to Word. 

# Packages needed

You'll need the following packages. Copy and paste the code below to get them all installed.

```{r}
list.of.packages <- c("googledrive", "knitr", "rmarkdown", "officedown", "officer", "pandoc")

new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
```

# Workflow

This set of scripts works by a stepwise process:
1. Download files from google docs and convert them to Rmd
2. Knit the Rmd to Word

At the end, you will have a Word doc that you have compiled straight from R. Cool, huh!!

# Google drive folder access

Anyone with a NOAA email should have access to [this](https://drive.google.com/drive/folders/1qC4L9CLsXyGkVn4pCFnCUZ8IanUokVZ5?usp=sharing) Google Drive folder containing docs for the final report.
