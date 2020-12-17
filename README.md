# BCsc Tutorial
Supporting material for the manuscript: 
Bray Curtis for single cell RNAseq data mining (BCsc).
PIacenti G, Alessandri L, Cordero F, Beccuti M, and Calogero RA

# Introduction

This vignette provides support to use SBray Curtis for single cell RNAseq data mining (BCsc).
BCsc analysis was added as extention of [*rCASC*](https://pubmed.ncbi.nlm.nih.gov/31494672/).


## Installation

To simplify usage and to guarantee reproducibility the tools required for the BCs workflow are embedded in docker containers stored at docker.io/repbioinfo. For more info on the computational approaches used in BCsc tutorial please see [*Kulkarni et al. BMC Bioinformatics 2018*](https://pubmed.ncbi.nlm.nih.gov/30367595/)

An extensive description of how rCASC works is provided at [*rCASC* vignette](https://kendomaniac.github.io/rCASC/articles/rCASC_vignette.html). Installation of rCASC including the SCA modules requires:

- A workstation/server running 64 bits Linux.

- Docker daemon installed on the machine, for more info see this document:

    [*https://docs.docker.com/engine/install/*](https://docs.docker.com/engine/install/).

- The functions in rCASC package require that user belongs to a group with the rights to execute docker. See the following document for more info: 

    [*https://docs.docker.com/engine/install/linux-postinstall/*](https://docs.docker.com/engine/install/linux-postinstall/)


To install the BCsctutorial, write in an R session:

```
install.packages("devtools")
library(devtools)
install_github("kendomaniac/BCsctutorial", ref="master")

```
Then, after package installation, execute in R:
```
library(SCAtutorial)
#check if docker daemon is  running and install rCASC package from github.
installing.rcasc()
```

This step checks that dockert daemon is running and downloads the dockert containers required for the tutorial. It might require sometime, between minutes to hours, depending on the available internet bandwidth.


## Web site

The vignette of the BCsc tutorial is available at [**vignette**](https://kendomaniac.github.io/BCsctutorial/articles/BCscvignette.html)

The vignette is located in the folder *BCsctutorial/docs/articles*. The vignette was built using the following command:

```
pkgdown::build_site()

```
 Data are instead located in *BCsctutorial/vignettes/data* folder.

