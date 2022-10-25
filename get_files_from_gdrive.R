# Download files from google drive ----------------------------------------
googledrive::drive_deauth()
googledrive::drive_auth()

# Download the chapters from google drive ---------------------------------
# This is the tag from the tail end of the hyperlink in the browswer. So to get it, go to your folder and copy/paste that combo of numbers and letters here:
dir_googledrive <- "1qC4L9CLsXyGkVn4pCFnCUZ8IanUokVZ5" 

id_googledrive <- googledrive::as_id(dir_googledrive)
dir_out_gdrive <- here::here("gdrive_downloads")

# List all files in the google drive
gdocs <- googledrive::drive_ls(path = id_googledrive, type = "document")

# Download chunks of text from google drive as .txt
for (i in 1:nrow(gdocs)) {
  googledrive::drive_download(
    file = googledrive::as_id(gdocs$id[i]), type = "txt",
    overwrite = TRUE,
    path = paste0(dir_out_gdrive, "/", gdocs$name[i])
  )
}

# Convert txt files in gdrive directory into Rmd files -------------------

txtfiles <- list.files(path = paste0(dir_out_gdrive, "/"), pattern = ".txt")

for (i in 1:length(txtfiles)) {
  print(txtfiles[i])
  rmarkdown::pandoc_convert(input = here::here("gdrive_downloads", paste(txtfiles[i])),
                 to = "markdown",
                 output = here::here(
                   "gdrive_downloads",
                   gsub(txtfiles[i], pattern = ".txt", replacement = ".Rmd")
                 ),
                 citeproc = TRUE # not sure if this is needed
  )
}
