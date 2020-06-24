library(logger)
library(fs)

today <- stringr::str_replace_all(lubridate::today(), "-", "")

fs::dir_create("log")

log_fname <- paste0(today, "_maparpav.log")
log_path <- fs::file_create(paste0("log/", log_fname))

log_appender(appender_file(log_path))



log_info('Creating names to retreive...')
tryCatch({
    filenames <- paste0(
      c("PM10avrg", "NO2max", "O3max"),
      "_map_00_",
      stringr::str_replace_all(lubridate::today(), "-", ""),
      ".txt"
    )
  },
)

urls <- paste0(
  "https://www.arpa.veneto.it/inquinanti/unipd/",
  filenames
)


purrr::walk2(urls, filenames, download.file)
