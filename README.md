# NanoStringNorm

1. [Description](#description)
2. [Installation](#installation)
3. [Resources](#resources)
4. [Getting Help](#getting-help)
5. [Citation Information](#citation-information)

## Description

*NanoStringNorm( is an R package for analyzing nCounter data. The nCounter platform employs direct digital detection technology that quantifies individual tagged nucleic acids without amplificaiton, enabling absolute quantification. For example plots and available functions, see the package [vignette](https://cran.r-project.org/web/packages/NanoStringNorm/vignettes/NanoStringNorm_Introduction.pdf).

### Key Features

* Comprehensive pre-processing for both miRNA and RNA
* Integrated quality control and diagnostic tools
* Flexible normalization framework with customizable methods
* Extensive diagnostic visualization, including interactive visualization, for results interpretation


## Installation

To install the latest public release of *NanoStringNorm* from CRAN:

```
install.packages('NanoStringNorm');
```

Or to install the latest development version from GitHub:

```
# install.packages('devtools');

devtools::install_github("uclahs-cds/package-NanoStringNorm");
```


## Resources

Available resources on *NanoStringNorm* usage can be found at the package [CRAN page](https://cran.r-project.org/package=NanoStringNorm), [reference manual](https://cran.r-project.org/web/packages/NanoStringNorm/NanoStringNorm.pdf), or [vignette](https://cran.r-project.org/web/packages/NanoStringNorm/vignettes/NanoStringNorm_Introduction.pdf).


## Getting Help

Looking for guidance or support with *NanoStringNorm*? Check out our [discussions page](https://github.com/uclahs-cds/package-NanoStringNorm/discussions).

Submit bugs, suggest new features, or see current work at our [issues](https://github.com/uclahs-cds/package-NanoStringNorm/issues) page.

[Pull requests](https://github.com/uclahs-cds/package-NanoStringNorm/pulls) are also open for discussion.


## Citation Information

To cite *NanoStringNorm* in publications use:

Waggott, D., Chu, K., Yin, S., Wouters, B.G., Liu, F.F., & Boutros, P.C. *NanoStringNorm: an extensible R package for the pre-processing of NanoString mRNA and miRNA data.* Bioinformatics 28, 11 (2012). https://doi.org/10.1093/bioinformatics/bts188

### BibTeX

```BibTeX
@article{
  NanoStringNorm,
  title = {NanoStringNorm: An extensible R package for the pre-processing of nanostring mrna and MIRNA data},
  journal = {Bioinformatics},
  doi = {10.1093/bioinformatics/bts188},
  url = {https://doi.org/10.1093/bioinformatics/bts188},
  volume = {28},
  number = {11},
  year = {2012},
  month = {April},
  day = {17},
  author = {Daryl Waggott and Kenneth Chu and Shaoming Yin and Bradly G. Wouters and Fei-Fei Liu and Paul C. Boutros}
} 
```
