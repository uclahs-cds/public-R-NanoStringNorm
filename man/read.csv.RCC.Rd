\name{read.csv.RCC}
\title{read.csv.RCC}
\alias{read.csv.RCC}
\description{A function to read the raw counts from the RCC Excel spreadsheet output by the nCounter platform. Excel file must be converted to CSV form.}
\usage{
read.csv.RCC(path, sample.id.row = 'File.Name')
}
\arguments{
  \item{path}{Path to the CSV version of spreadsheet output from nCounter.  This should be a string with the path pointing to the desired file.}
  \item{sample.id.row}{The row in the RCC file that contains the sample IDs to be used as column names for the count data.  Defaults to "File.Name" but in some cases "Sample.ID" or "Lane.ID" would be more appropriate.}
}

\value{
Returns a list with two components.  The first is the header information which contains sample IDs and diagnostic information on the quality of the samples.  The second is the count data and can be directly used in the input to NanoStringNorm.
}
\examples{
 
# directly import the nCounter output
path.to.csv.file <- system.file("extdata", "RCC_files", "RCCCollector1_rat_tcdd.csv",
	package = "NanoStringNorm");
NanoString.mRNA <- read.csv.RCC(x = path.to.csv.file);

}
\author{Daryl M. Waggott}
\keyword{NanoString}
\keyword{Normalization}
\keyword{mRNA}  
\keyword{miRNA}
