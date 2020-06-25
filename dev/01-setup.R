#' ---
#' title: "Setup (with `{renv}`)"
#' author: "Corrado Lanera"
#' date: "`r date()`"
#' output:
#'   html_document:
#'     toc: true
#'     toc_float: true
#' ---
#'
#' ```{r setup, include=FALSE}
#' knitr::opts_chunk$set(
#'   echo = TRUE,
#'   eval = FALSE
#' )
#' ```
#'
#' > NOTE: For projects which would not use `{renv}` support,
#'         see `01-pkgsetup.R` (here, in this gist).
#'


#'
#' Prerequisites
#' ====================================================================
#'

available::available("maparpav")
usethis::create_package("~/Documents/ubesp/maparpav")

usethis::use_directory("dev", ignore = TRUE)
fs::file_create("dev/01-setup.R")
rstudioapi::navigateToFile("dev/01-setup.R")
usethis::use_roxygen_md()
usethis::use_news_md()








#'
#' Documentiation
#' ====================================================================
#'
#' DESCRIPTION
#' --------------------------------------------------------------------
#'
usethis::use_gpl3_license("Corrado Lanera")
usethis::use_package_doc()




#'
#' README
#' --------------------------------------------------------------------
#'
#' Initialize the README file (ie the package's landing page)
#'

# install.packages("rmarkdown")
usethis::use_readme_rmd()

outfile <- tempfile(fileext = ".png")

library(ggplot2)
p <- ggplot(
  aes(x = mpg, y = wt), data = mtcars) +
  geom_point() +
  theme_void() +
  hexSticker::theme_transparent()

hexSticker::sticker(p, package = "maparpav", filename = outfile,
  p_size = 20, s_x = 1.05, s_y = .8, s_width = 0.6, s_height = 0.5
)
usethis::use_logo(outfile)

usethis::use_cran_badge()
usethis::use_lifecycle_badge("Maturing")
usethis::use_code_of_conduct()

usethis::use_spell_check()
spelling::spell_check_package()
spelling::update_wordlist()

#'
#' > knit the README
#'








#'
#' Supporting Folders
#' ====================================================================
#'
usethis::use_directory("log", ignore = TRUE)
#'     usethis::use_directory("output", ignore = TRUE)
#'








#'
#' Test suit
#' ====================================================================
#'
usethis::use_testthat()

#'
#' Create a simple test to check everything works.
#' You can delete it AFTER you have written another test at least.
#'
#' Check it works:
#'
usethis::use_test("foo") # `test_that("foo works", expect_null(foo()))`
devtools::test()         # see it fails!!
usethis::use_r("foo")    # define `foo <- function() NULL`
devtools::test()         # see it passes!!

#'
#' `foo` deleted after the inclusion of another function
#'

#'
#' Automating background continuous tests on RStudio (free command line)
#' --------------------------------------------------------------------
#'
renv::install("CorradoLanera/autotestthat") # {renv} installation
















#'
#' Quality assurance
#' ====================================================================
#'
usethis::use_tidy_description()

# install.packages("lintr)
lintr::lint_package()

#'
#' and fix the spelling script that lint
#' have opened... ;-)
#'
if (requireNamespace("spelling", quietly = TRUE)) {
  spelling::spell_check_test(
    vignettes = TRUE,
    error = FALSE,
    skip_on_cran = TRUE
  )
}

#'
#' Check again:
#'
lintr::lint_package()

devtools::check_man()
devtools::test()
devtools::check()








#'
#' Activate Git/GitHub
#' ====================================================================
#'
usethis::use_git()
usethis::git_vaccinate()
usethis::use_github("UBESP-DCTV", private = TRUE)
usethis::use_tidy_github()





#'
#' Activate {renv} for reproducibility
#' ====================================================================
#'
#' We will use "explicit" snapshot whith the intent
#' of capture what is included in the
#' DESCRIPTION file only.
#'
renv::init(settings = list(snapshot.type = "explicit"))
renv::status() # just to check








#'
#' Package website documentation
#' ====================================================================
#'
#' > Disclaimer (2020-06-22): This and the following actions are mine
#' modification of the ones you can find in
#' https://github.com/r-lib/actions/blob/master/examples/pkgdown.yaml
#' The changes are made to made the action able to be used with `{renv}`
#' as suggested in
#' https://rstudio.github.io/renv/articles/ci.html#github-actions
#'
#' As soon/if there will be implemented _official_ Actions, I will
#' substitute these with those ones.
#'
usethis::use_github_action(
  url = "https://raw.githubusercontent.com/CorradoLanera/actions/master/pkgdown.yaml"
)

usethis::use_github_actions_badge("pkgdown")
# renv::install("GuangchuangYu/badger")
badger::badge_custom("WEBsite", "click-me", "orange", "http://ubesp-dctv.github.io/maparpav/")
#'
#' And add it between title and logo in the README and knit it.
#'


#'
#' Continuous Integration
#' ====================================================================
#'
#' Lint (static code-quality checks)
#' --------------------------------------------------------------------
#'

usethis::use_github_action(
  url = "https://raw.githubusercontent.com/CorradoLanera/actions/master/lint-renv.yaml"
)
usethis::use_github_actions_badge("lint")

#'
#' WARNING: if you do not use {renv} for your project, call
#'
#'     usethis::use_github_action("lint")
#'     usethis::use_github_actions_badge("lint")
#'


#' R-CDM-check and coverage
#' --------------------------------------------------------------------
usethis::use_github_action(
  url = "https://raw.githubusercontent.com/CorradoLanera/actions/master/R-CMD-check-renv.yaml"
)
usethis::use_github_actions_badge("R-CMD-check")

usethis::use_github_action(
  url = "https://raw.githubusercontent.com/CorradoLanera/actions/master/covr-renv.yaml"
)
usethis::use_github_actions_badge("test-coverage")








#'
#' Other minor support, final checks, and update version
#' ====================================================================
#'
#'
#' Add pipe (`%>%`) support
#' --------------------------------------------------------------------
#'
usethis::use_pipe()


#' Checks
#' --------------------------------------------------------------------
#'
usethis::use_tidy_description()
devtools::check_man()

spelling::spell_check_package()
spelling::update_wordlist()

lintr::lint_package()
renv::status()
devtools::check()

#' New ersion
#' --------------------------------------------------------------------
#'
#' > Update and knit the `README.Rmd`
#'
usethis::use_version("dev")







#'
#' Start to develop
#' ====================================================================
#'
fs::file_create("dev/02-development.R")
rstudioapi::navigateToFile("dev/02-development.R")
#'
#' commit and push...
#' Happy packaging!
#'
