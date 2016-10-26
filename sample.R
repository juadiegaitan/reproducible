## ----install_rmarkdown, eval=FALSE---------------------------------------
## install.packages("rmarkdown")

## ----render_rmarkdown, eval=FALSE, message=FALSE-------------------------
## rmarkdown::render("sample.Rmd", clean=TRUE, output_format="html_document")
## 

## ----render_commandline, eval=FALSE, message=FALSE, engine="sh"----------
## $ Rscript -e "rmarkdown::render('sample.Rmd', output_format=c('pdf_document', 'html_document'), clean=FALSE)"; R CMD Stangle sample.Rmd

## ----render_makefile, eval=FALSE, message=FALSE, engine="sh"-------------
## $ make -B

## ----kable---------------------------------------------------------------
library(knitr)
kable(iris[1:12,])

## ----some_jitter_plot, eval=TRUE-----------------------------------------
library(ggplot2)
dsmall <- diamonds[sample(nrow(diamonds), 1000), ]
ggplot(dsmall, aes(color, price/carat)) + geom_jitter(alpha = I(1 / 2), aes(color=color))

## ----some_custom_inserted_plot, eval=TRUE, warning=FALSE, message=FALSE----
png("myplot.png")
ggplot(dsmall, aes(color, price/carat)) + geom_jitter(alpha = I(1 / 2), aes(color=color))
dev.off()

## ----sessionInfo---------------------------------------------------------
sessionInfo()

