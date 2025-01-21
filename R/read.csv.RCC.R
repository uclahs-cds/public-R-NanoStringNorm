read.csv.RCC <- function(path, sample.id.row = 'File.Name') {
    if (!file.exists(path)) {
        stop(paste('File not found:', path)) ;
        }

    prep.rcc <- function(path) {
        data <- read.csv(
            path,
            header = FALSE,
            strip.white = TRUE
            );
        data <- data[!sapply(data, function(x) all(is.na(x)))];

        data.start.index <- min(which(data[, 1] == 'Reporter Counts'));
        header <- data[1:(data.start.index - 1), ];
        data <- data[data.start.index:nrow(data), ];

        return(list(
            header = header,
            x = data
            ));
        }
    rcc <- prep.rcc(path);

    if (is.null(rcc$header)) {
        stop('There appears to be a problem with the RCC CSV file. No header information found.');
        }

    rcc$header <- rcc$header[is.na(rcc$header[1]) | (rcc$header[1] != ''), ];
    rownames(rcc$header) <- rcc$header[, 1];
    rcc$header <- rcc$header[, -1];

    rownames(rcc$header) <- gsub(' $', '', rownames(rcc$header));
    rownames(rcc$header) <- gsub(' ', '.', rownames(rcc$header));
    rownames(rcc$header) <- tolower(rownames(rcc$header));

    if ('id' %in% rownames(rcc$header)) {
        rownames(rcc$header)[rownames(rcc$header) == 'id'] <- 'sample.id';
        }

    if (!all(c('file.name', 'sample.id', 'binding.density') %in% rownames(rcc$header)))  {
        stop('There appears to be a problem with the RCC CSV file. Rownames in header are missing "File name", "Sample id", "Binding density"');
        }

    rcc$header <- rcc$header[!rownames(rcc$header) %in% c('file.attributes', 'lane.attributes'), -c(1,2)];

    sample.ids <- rcc$header[rownames(rcc$header) %in% tolower(sample.id.row),];
    sample.ids <- gsub(' ', '.', sample.ids);
    sample.ids <- gsub('^([0-9])', 'X\\1', sample.ids);
    colnames(rcc$header) <- sample.ids;

    if (is.null(rcc$x)) {
        stop('There appears to be a problem with the RCC CSV file. Likely couldnt find the count specifically "Code Class" in header information.');
        }

    colnames(rcc$x) <- rcc$x[2, ];
    rcc$x <- rcc$x[-c(1:2), 1:(3 + length(sample.ids))];

    rows.with.missing.anno <- (rcc$x[, 1] == '' | rcc$x[, 2] == '');
    if (any(rows.with.missing.anno)) {
        rcc$x <- rcc$x[!rows.with.missing.anno,];
        cat(paste('The following row(s)', paste(which(rows.with.missing.anno), collapse = ', '), 'have been dropped due to missing annotation.\n\t  You may want to double check the excel file.\n\n'));
        }

    colnames(rcc$x) <- gsub(' ', '.', colnames(rcc$x));
    colnames(rcc$x) <- c(colnames(rcc$x)[1:3], sample.ids);
    rcc$x[, sample.ids] <- lapply(rcc$x[, sample.ids], as.numeric);

    cat(paste('There were', length(sample.ids), 'samples imported. \nNote that spaces in sample names will be replaced by dots. \n'));

    if (length(sample.ids) > 5) {
        cat('The first and last 3 sample names found in the dataset are:\n');
        cat(paste(c(sample.ids[1:3], rev(sample.ids)[1:3])));
        }
    else {
        cat('The sample names found in the dataset are:\n');
        cat(paste(sample.ids));
        }

    cat(paste('\n\nThere were', nrow(rcc$x), 'genes imported with the following Code Class breakdown:'));
    print(table(rcc$x[, 'Code.Class']));

    class(rcc) <- 'NanoString';
    return(rcc);
    }
