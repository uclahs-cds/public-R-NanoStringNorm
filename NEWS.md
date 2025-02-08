# NanoStringNorm 3.0.0 (2025-02-07)

## Removed
* Removed Excel `.xls` support due to broken CRAN dependency

## Added
* Added CSV support for nCounter Excel files. Excel files must be converted externally.
* Added content to README

## Changed
* Update changelog to Markdown format
* Replaced RUnit framework with testthat


# NanoStringNorm 2.0.0 (2023-03-21)

## Removed
* Removed vsn functionality due to broken CRAN dependency


# NanoStringNorm 1.2.1 (2017-12-11)

## Fixed
* Fixed unclosed file connection bug


# NanoStringNorm 1.2.0 (2017-08-18)

## Fixed
* fixed read.markup.RCC() error on new NanoString nCounter FLEX instrument


# NanoStringNorm 1.1.22 (2017-06-30)

## Added
* NanoStringNorm
 - added parameters "CodeCount.summary.target" and "SampleContent.summary.target"
 - these parameters allow users to specify expected positive control and housekeeping probe summary values, which are used during the cross-sample normalization
 - this update allows for sample-independent normalization of various CodeCount and SampleContent methods 


# NanoStringNorm 1.1.17 (2014-01-15)

## Fixed
* fixed error using only one control gene.  the matrix in the apply statement was getting changed to vector.


# NanoStringNorm v1.1.16 (2013-09-01)

## Changed
* lme4
  * lme4 doesn't work on some platforms
  * NSN "suggests" lme4 but errored out if it was missing due to examples
  * solution was add if(require(pkg)) in examples
  * this was done for all suggests packages
* Runit
  * if(require(RUnit)) was added to NanoStringNorm.unitTests.R.  Runit was recommended by BR to be a suggests and not a depends.  
  * package needs to be able to run/test with and without suggest packages

## Fixed 
* Rd line length.  R-devel fails on example/usage length of 90.
* ::: dropped in code due to check warning


# NanoStringNorm 1.1.15 (2014-01-15)

## Fixed
* R check compatablility
* reduced size of high resolution bitmaps used in vignette (100kb saved!)
* changed Nanostring to NanoString in text (seriously!)
* made googleVis example conditional depending on installation.  the package is under "suggests"
* bug when negative control removes signal from all samples


# NanoStringNorm 1.1.14 (2013-04-04)

## Fixed
* sample.content.norm.  added some error handling for cases where rna.content was estimated to be zero, resulting in normalization factors that were infinity and errors in norm.comp


# NanoStringNorm 1.1.12 (2012-12-01)

## Fixed
* read.xls.RCC.  more informative error messages and allowed id instead of sample.id in header
* Plot.NanoStringNorm.gvis.  set default browser if not set.

# NanoStringNorm 1.1.11 (2012-10-01)

## Added
* added parameter "guess.cartridges" in NanoStringNorm function.  Cartridge estimates can be estimated from sample order and used in batch effect estimates
* in Plot.NanoStringNorm the control types have different symbols
* added some text to better describe the figures.  also replaced the png with pdf for better resolution
* made it so you can add manual and auto labels at the same time
* added options label.n to specify the number of outliers to plot and label.as.legend to allow the labels to be written as a legend to avoid messy overlaps
* output FDR qvalues

## Fixed
* Plot.NanoStringNorm had a missing curly brace and forgotten browser statement
* Shifted labels on positive.control plot to avoid overlap if long
* Added regex for positive control names in cv plot, probe.correction function and norm.comp.  sometimes the positive controls are named differently causing them to be missed during calculations
* Fixed volcano plot label to show log2 Fold-Change if log taken
* Fixed volcano plot y-axis break.  the xlim was not getting set properly
* Fixed norm.factor plot positions when only one plot
* changed low.cv.geo.mean method to better find low cv genes 


# NanoStringNorm 1.1.10 (2012-09-01)

## Added
* Added colour argument `col` in Plot.NanoStringNorm to change default plotting colours
* Added function read.markup.RCC to process single sample markup RCC files
* Changed NanoStringNorm log argument to `take.log`
* Added NanoStringNorm argument `is.log`.  This switches a number of error checks i.e. no error if negative values and also changes the calculation of the geometric mean.  The purpose is to allow PCR type data to be process i.e. TLDA and OpenArray
* Added trycatch to norm.comp which returns NA if a methods fails i.e. no HK genes
* Added rescale function to Plot.NanoStringNorm in order to bound the size of points the volcano plots
* Added argument to choose sample column names from header rows.
* Added argument `icc.method` in norm.comp to choose between anova (fast) and mixed (more appropriate)
* Changed default sample name in read.xls.rcc to file.name

## Fixed
* Added check in NanoStringNorm to check if input is a matrix, list, or data.frame
* Added check for `Code.Class` colum in norm.comp.  The col is referenced but the data is not exhaustively checked.  The check was also added to the read.markup.RCC function
* Added check for problem input in read.xls.RCC
* Fixed read.xls.RCC parsing of rows with missing values 
* Fixed missing Lane.ID in header when using reas.xls.RCC
* Added check for problem probe correction input
* Added tryCatch around mixed model ICC calculations in norm.comp i.e. HK genes reduced to zero.
* Added tryCatch around CV calculations in norm.cmop
* Fixed plotting erros for small datasets below 12 samples

