# googledrive-to-rmd-example
A brief example showing how to integrate Google docs and Rmd to make reports, etc. This particular example is built to knit to Word. I like this approach for cases where I am either working with a large group of collaborators (thus making Markdown collab straight on GitHub kind of a pain), or working on a product with collaborators who have a range of different skills, including folks who don't regularly use GitHub.

If I did this right, you should be able to clone this repo and knit the "MainDocument.Rmd" file to make a full report.

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

## Entry points for folks who aren't set up for RStudio/git/Markdown

There are many "entry points" where you can collaborate with people on different parts of the report. Here are some options for where people from your team can contribute. These will all be fairly painless in terms of the editing/knitting report generation process:

* editing text in Google docs
* editing citations in [`cite/bibliography.bib`](https://github.com/MargaretSiple-NOAA/googledrive-to-rmd-example/blob/main/cite/bibliography.bib) (can edit in browser on github). They can use [zbib.org](https://zbib.org/) to get the BibTeX version of any citation. Or if they want to add several at once, export them from a Zotero or Mendeley library and save as (or paste into) `bibliography.bib`
* creating tables as text or figures as any image format (these can be imported painlessly using `read.csv()` and `knitr::include_graphics()` in your R code chunks)

# Google drive folder access

Anyone with a NOAA email should have access to [this](https://drive.google.com/drive/folders/1qC4L9CLsXyGkVn4pCFnCUZ8IanUokVZ5?usp=sharing) Google Drive folder containing docs for the final report.

# Do you have questions or hot tips?

Or if something isn't working... please leave an issue above.
