# The NanoStringNorm package is copyright (c) 2012 Ontario Institute for Cancer Research (OICR)
# This package and its accompanying libraries is free software; you can redistribute it and/or modify it under the terms of the GPL
# (either version 1, or at your option, any later version) or the Artistic License 2.0.  Refer to LICENSE for the full license text.
# OICR makes no representations whatsoever as to the SOFTWARE contained herein.  It is experimental in nature and is provided WITHOUT
# WARRANTY OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE OR ANY OTHER WARRANTY, EXPRESS OR IMPLIED. OICR MAKES NO REPRESENTATION
# OR WARRANTY THAT THE USE OF THIS SOFTWARE WILL NOT INFRINGE ANY PATENT OR OTHER PROPRIETARY RIGHT.
# By downloading this SOFTWARE, your Institution hereby indemnifies OICR against any loss, claim, damage or liability, of whatsoever kind or
# nature, which may arise from your Institution's respective use, handling or storage of the SOFTWARE.
# If publications result from research using this SOFTWARE, we ask that the Ontario Institute for Cancer Research be acknowledged and/or
# credit be given to OICR scientists, as scientifically appropriate.

other.normalization <- function(x, anno, OtherNorm = 'none', verbose = TRUE, genes.to.fit = NA, genes.to.predict = NA, ...) { 

	if (OtherNorm == 'quantile') {
		x = other.normalization.quantile(x, anno, OtherNorm, verbose = verbose, genes.to.fit = genes.to.fit);
		}
	else if (OtherNorm == 'zscore') {
		x = other.normalization.zscore(x, anno, OtherNorm, verbose = verbose, genes.to.fit = genes.to.fit);
		}
	else if (OtherNorm == 'rank.normal') {
		x = other.normalization.rank.normal(x, anno, OtherNorm, verbose = verbose, genes.to.fit = genes.to.fit);
		}
	else if (OtherNorm == 'none') {
		return(x);
		}
	else {
		stop(paste('OtherNorm:  The OtherNorm option', OtherNorm, 'is not implemented try using one of quantile, zscore, rank.normal.'));
		}

	return(x);
	}
