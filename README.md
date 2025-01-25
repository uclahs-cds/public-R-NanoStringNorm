# NanoStringNorm

1. [Description](#description)


## Description

*NanoStringNorm* is a suite of tools used to pre-process, run diagnostics, and visualize NanoString nCounter expression data. nCounter data has some unique features as compared to traditional intensity based arrays. Specifically, it uses direct digital detection requiring minimal sample intervention. The "direct" refers to the process of counting individual tagged nucleic acids without any need for amplification and the "digital" nature refers to the capacity to use absolute and specific quantification, independent of relative measures like intensity or amplification cycles. As such, the platform is useful for an array of study designs (multiplexed samples, joint miRNA - mRNA code sets) and sample types (FFPE, plasma, whole lysate). The consequence of this flexibility is that not all pre-processing methods are valid with all tissues and code sets. For example, housekeeping genes are a fundamental part of mRNA standardization, however their appropriateness is not clear for miRNA data. *NanoStringNorm* emphasizes normalization diagnostics and visualization of results in order to provide the best data, void of technical artifacts for downstream analysis. Moreover, the package is designed to be fully extensible in order to support and evaluate new pre-processing methods.


## Resources

Available resources on *NanoStringNorm* usage can be found at the package [CRAN page](https://cran.r-project.org/package=NanoStringNorm), [reference manual](https://cran.r-project.org/web/packages/NanoStringNorm/NanoStringNorm.pdf), or [vignette](https://cran.r-project.org/web/packages/NanoStringNorm/vignettes/NanoStringNorm_Introduction.pdf).


## Getting Help

Looking for guidance or support with *NanoStringNorm*? Check out our [discussions page](https://github.com/uclahs-cds/public-R-NanoStringNorm/discussions).

Submit bugs, suggest new features, or see current work at our [issues](https://github.com/uclahs-cds/public-R-NanoStringNorm/issues) page.

[Pull requests](https://github.com/uclahs-cds/public-R-NanoStringNorm/pulls) are also open for discussion.


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