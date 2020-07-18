## ----setup, include=FALSE-----------------------------------------------------
library(tint)
library(ggplot2)
mtcars$am <- factor(mtcars$am, labels=c("manual", "automatic"))
## download files if connected -- and we're not on Windows as this consistently failed
## when not connected (or on Windows), two margin figure will not be shown, the rest
## is still processed as usual
connected <- tint:::.isConnected() && .Platform$OS.type != "windows"
if (connected) {
    tmpdir <- normalizePath(tempdir(), winslash = "/")
    latofile <- file.path(tmpdir, "tintPdfLatoPage1.pdf")
    garamondfile <- file.path(tmpdir, "tintPdfGaramondPage1.pdf")
    download.file("https://eddelbuettel.github.io/tint/tintPdfLatoPage1.pdf",
                  latofile, quiet = TRUE)
    download.file("https://eddelbuettel.github.io/tint/tintPdfGaramondPage1.pdf",
                  garamondfile, quiet = TRUE)
}

## ----fig-nocap-margin-first, fig.margin=TRUE, fig.width=4, fig.height=4, cache=TRUE, echo=FALSE----
ggplot(mtcars, aes(wt, mpg)) + geom_point(size=3, aes(colour=factor(cyl))) +
    theme(legend.position="none")

## ----fig-nocap-margin-second, fig.margin=TRUE, fig.width=4, fig.height=4, cache=TRUE, echo=FALSE----
ggplot(mtcars, aes(wt, mpg)) + geom_point(size=3, aes(colour=factor(cyl))) +
    theme_tint() + theme(legend.position="none")

## ----fig-fullwidth, fig.width = 10, fig.height = 3, fig.fullwidth = TRUE, fig.cap = "A full width figure.", echo=FALSE, cache=TRUE----
ggplot(mtcars, aes(wt, mpg)) + geom_point(size=3, aes(colour=am)) + facet_wrap(~ factor(cyl)) +
    theme(legend.position="bottom")

## ----fig-main, fig.cap = "A figure in the main column.", cache=TRUE, echo=FALSE----
ggplot(mtcars, aes(wt, mpg)) +
    geom_point(size=2, aes(colour=factor(cyl))) +
    theme_tint() + theme(legend.position="none")

## ----fig-lato-screenshot, fig.margin=TRUE, cache=TRUE, echo=FALSE-------------
if (connected) knitr::include_graphics(latofile, dpi = NA)

## ----fig-garamond-screenshot, fig.margin=TRUE, cache=TRUE, echo=FALSE---------
if (connected) knitr::include_graphics(garamondfile, dpi = NA)

