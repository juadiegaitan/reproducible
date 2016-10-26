## ----install_rmarkdown, eval=FALSE---------------------------------------
## install.packages("rmarkdown")

## ----render_rmarkdown, eval=FALSE, message=FALSE-------------------------
## rmarkdown::render("sample.Rmd", clean=TRUE, output_format=c("pdf_document", "html_document"))
## 

## ----render_commandline, eval=FALSE, message=FALSE, engine="sh"----------
## $ Rscript -e "rmarkdown::render('sample.Rmd', output_format=c('pdf_document', 'html_document'), clean=TRUE)"
## $ Rscript -e "knitr::knit('sample.Rmd', tangle=TRUE)"

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

## ----git_syntax1, eval=FALSE, engine="sh"--------------------------------
## $ git <command> --help

## ----git_syntax2, eval=FALSE, engine="sh"--------------------------------
## $ git init

## ----git_syntax3, eval=FALSE, engine="sh"--------------------------------
## $ git add myfile
## $ git add -A :/ # recursively

## ----git_syntax4, eval=FALSE, engine="sh"--------------------------------
## $ git commit -am "some edits"

## ----git_syntax5, eval=FALSE, engine="sh"--------------------------------
## $ git remote add origin https://github.com/tgirke/myrepos.git

## ----git_syntax6, eval=FALSE, engine="sh"--------------------------------
## $ git push -u origin master

## ----git_syntax7, eval=FALSE, engine="sh"--------------------------------
## $ git clone git@github.com:<user_name>/<repos_name>.git

## ----git_syntax8, eval=FALSE, engine="sh"--------------------------------
## $ git pull

## ----git_syntax9, eval=FALSE, engine="sh"--------------------------------
## git commit -am "some edits"; git push -u origin master

## ----package_skeleton1, eval=FALSE---------------------------------------
## package.skeleton(name="mypackage", code_files=c("script1.R", "script2.R"))

## ----r_build_package, eval=FALSE-----------------------------------------
## $ R CMD build mypackage
## $ R CMD check mypackage_1.0.tar.gz

## ----install_package, eval=FALSE-----------------------------------------
## install.packages("mypackage_1.0.tar.gz", repos=NULL)

## ----package_skeleton2, eval=FALSE---------------------------------------
## package.skeleton(name="mypackage", code_files=c("script1.R"), namespace=TRUE)

## ----build_package_tar, eval=FALSE---------------------------------------
## system("R CMD build mypackage")

## ----install_package_tar, eval=FALSE-------------------------------------
## install.packages("mypackage_1.0.tar.gz", repos=NULL, type="source")
## library(mypackage)
## ?myMAcomp # Opens help for function defined by mypackage

## ----bioparallel_singlemachine, eval=FALSE-------------------------------
## library(BiocParallel)
## df <- iris[,1:4]
## f <- function(x) rowMeans(df[x,])
## bplist <- bplapply(seq(along=df[,1]), f, BPPARAM = MulticoreParam(workers=2))
## bplist(unlist)

## ----bioparallel_cluster, eval=FALSE-------------------------------------
## library(BiocParallel); library(BatchJobs)
## df <- iris[1:20,1:4st(bplist)]
## f <- function(x) {
##     df <- iris[1:20,1:4]
##     rowMeans(df[x,])
## }
## funs <- makeClusterFunctionsTorque("torque.tmpl")
## param <- BatchJobsParam(length(df[,1]), resources=list(walltime="20:00:00", nodes="1:ppn=1", memory="6gb"), cluster.functions=funs)
## register(param)
## bplist <- bplapply(seq_along(df[,1]), f)

## ----sessionInfo---------------------------------------------------------
sessionInfo()

