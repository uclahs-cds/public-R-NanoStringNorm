\name{other.normalization}
\title{other.normalization}
\alias{other.normalization}
\description{This function can be used to normalize mRNA and miRNA expression data from the NanoString platform.}
\usage{
other.normalization(
 x,
 anno,
 OtherNorm = 'none',
 verbose = TRUE,
 genes.to.fit,
 genes.to.predict,
 ...);
}
\arguments{
  \item{x}{The data used for Normalization.  This is typically the raw expression data as exported from an Excel spreadsheet.  If anno is NA then the first three columns must be \emph{c('Code.Class', 'Name', 'Accession')} and the remaining columns refer to the samples being analyzed.  The rows should include all control and endogenous genes.}
  \item{anno}{Alternatively, anno can be used to specify the first three annotation columns of the expression data.  If anno used then it assumed that 'x' does not contain these data.  Anno allows flexible inclusion of alternative annotation data.  The only requirement is that it includes the 'Code.Class' and 'Name' columns. Code.Class refers to gene classification i.e. Positive, Negative, Housekeeping or Endogenous gene.}
  \item{OtherNorm}{Some additional normalization methods.  Options \strong{currently} include \emph{'none', 'zscore',} and \emph{'rank.normal'}.  OtherNorm is applied after CodeCount, Background, SampleContent normalizations, therefore you may want to set them to 'none'.}
  \item{verbose}{Enable run-time status messages}
  \item{genes.to.fit}{The set of genes used to generate the normalization parameters.  You can specify a vector of code classes or gene names as indicated in the annotation.  Alternatively, you can use descriptors such as 'all', 'controls', 'endogenous'.  For most methods the model will be fit and applied to the endogenous genes.}
  \item{genes.to.predict}{The set of genes that the parameters or model is applied to.}
  \item{...}{The ellipses are included to allow flexible use of parameters that are required by sub normalization methods.}
}
\details{
The methods used for OtherNorm are designed to be extensible to alternate and evolving NanoString pre-processing analysis.  These can be combined with standard  CodeCount, Background, SampleContent methods (i.e. positive, negative and housekeeping controls).  
\cr\cr
zscore is simply scaling each sample to have a mean 0 and standard deviation of 1.  Similarly, rank.normal uses the quantiles or ranks to transform to the normal distribution with mean 0 and standard deviation of 1.  Both methods are helpful when comparing multiple datasets or platforms during meta or joint analysis due to the abstraction of effects sizes or expression scale.
\cr\cr
quantile normalization is based on pegging each sample to an empirically derived distribution.  The distribution is simply the mean expression across all samples for each gene rank.
}
\references{
See NanoString website for PDFs on analysis guidelines:
	\url{https://www.nanostring.com/support/product-support/support-documentation}

The NanoString assay is described in the paper:
	Fortina, P. & Surrey, S. Digital mRNA profiling. Nature biotechnology 26, 293-294 (2008).
}
\author{Daryl M. Waggott}
\note{Future updates to include more informative diagnostic plots, trait specific normalization and replicate merging.}
\examples{

# load the NanoString.mRNA dataset
data(NanoString);

# specify housekeeping genes in annotation 
NanoString.mRNA[NanoString.mRNA$Name \%in\% 
	c('Eef1a1','Gapdh','Hprt1','Ppia','Sdha'),'Code.Class'] <- 'Housekeeping';

# z-value transformation. scale each sample to have a mean 0 and sd
# by default all the other normalization methods are 'none'
# you cannot apply a log because there are negative values
# good for meta-analysis and cross platform comparison abstraction of effect size
NanoString.mRNA.norm <- NanoStringNorm(
	x = NanoString.mRNA,
	OtherNorm = 'zscore',
	return.matrix.of.endogenous.probes = TRUE
	);


# inverse normal transformation. use quantiles to transform each sample to 
# the normal distribution
NanoString.mRNA.norm <- NanoStringNorm(
	x = NanoString.mRNA,
	OtherNorm = 'rank.normal',
	return.matrix.of.endogenous.probes = TRUE
	);

# quantile normalization.  create an empirical distribution based on the 
# median gene counts at the same rank across sample.  then transform each
# sample to the empirical distribution.
NanoString.mRNA.norm <- NanoStringNorm(
	x = NanoString.mRNA,
	OtherNorm = 'quantile',
	return.matrix.of.endogenous.probes = FALSE
	);
}
\keyword{NanoString}
\keyword{Normalization}
\keyword{mRNA}  
\keyword{miRNA}
