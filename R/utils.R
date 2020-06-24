glued_today <- function() {
  stringr::str_replace_all(lubridate::today(), "-", "")
}
