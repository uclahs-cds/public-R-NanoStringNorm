# The NanoStringNorm package is copyright (c) 2012-2018 Ontario Institute for Cancer Research (OICR) and (c) 2019-2025 Univeristy of California, Los Angeles (UCLA).
# This package and its accompanying libraries is free software; you can redistribute it and/or modify it under the terms of the GPL
# (either version 1, or at your option, any later version) or the Artistic License 2.0.  Refer to LICENSE for the full license text.
# OICR and UCLA make no representations whatsoever as to the SOFTWARE contained herein.  It is experimental in nature and is provided WITHOUT
# WARRANTY OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE OR ANY OTHER WARRANTY, EXPRESS OR IMPLIED. OICR AND UCLA MAKE NO REPRESENTATION
# OR WARRANTY THAT THE USE OF THIS SOFTWARE WILL NOT INFRINGE ANY PATENT OR OTHER PROPRIETARY RIGHT.
# By downloading this SOFTWARE, your Institution hereby indemnifies OICR and UCLA against any loss, claim, damage or liability, of whatsoever kind or
# nature, which may arise from your Institution's respective use, handling or storage of the SOFTWARE.
# If publications result from research using this SOFTWARE, we ask that the Ontario Institute for Cancer Research and University of California, Los Angeles be acknowledged and/or
# credit be given to OICR and UCLA scientists, as scientifically appropriate.

get.sample.summary.stats <- function(x, anno) {

		# calculate mean of each sampleContent
		sample.mean <- apply(
			X = x[grep('Endogenous', anno$Code.Class),],
			MARGIN = 2,
			FUN = mean,
			na.rm = TRUE
			);

		# calculate SD of each sampleContent
		sample.sd <- apply(
			X = x[grep('Endogenous', anno$Code.Class),],
			MARGIN = 2,
			FUN = sd,
			na.rm = TRUE
			);

		# calculate proportion missing values
		sample.proportion.missing <- apply(
			X = x[grep('Endogenous', anno$Code.Class),],
			MARGIN = 2,
			FUN = function(y) { sum(y <= 0, na.rm = TRUE) / length(y); }
			);

	return(
		data.frame(
			row.names = names(x),
			Sample.Mean = sample.mean,
			Sample.SD = sample.sd,
			Sample.Missing = sample.proportion.missing
			)
		);
	}
