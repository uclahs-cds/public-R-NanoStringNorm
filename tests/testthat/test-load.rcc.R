test_that(
    'read.csv.RCC header loads correctly', {
        load('data/load.rcc.Rda');

        path <- system.file(
            'extdata',
            'RCC_files',
            'RCCCollector1_rat_tcdd.csv',
            package = 'NanoStringNorm'
            );
        result <- read.csv.RCC(path);
        expect_equivalent(result$header, csv.nanostring.mrna.result$header);
        }
    );

test_that(
    'read.csv.RCC counts load correctly', {
        load('data/load.rcc.Rda');
        
        path <- system.file(
            'extdata',
            'RCC_files',
            'RCCCollector1_rat_tcdd.csv',
            package = 'NanoStringNorm'
        );
        result <- read.csv.RCC(path);
        expect_equivalent(result$x, csv.nanostring.mrna.result$x, );
    }
);