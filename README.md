# Data Science Tools Workshop: Working with confidential data



[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.5620889.svg)](https://doi.org/10.5281/zenodo.5620889)


Prepared for presentation at [MONT^2](https://www.mont2-econlab.com/) on 2021-10-29.

## Creating Presentation Slides

This presentation is about reproducibility, and it is created in a reproducible way. This README describes how, using the [template README](https://social-science-data-editors.github.io/template_README/).

Data Availability and Provenance Statements
----------------------------

### Statement about Rights

- [x] I certify that the author(s) of the manuscript have legitimate access to and permission to use the data used in this manuscript. 

### Summary of Availability

- [x] All data **are** publicly available.
- [ ] Some data **cannot be made** publicly available.
- [ ] **No data can be made** publicly available.

### Details on each Data Source

For instructional purpose, not all data is included within the repository. Some data is dynamically downloaded from an API. While I do not believe that the data will change in the future, the API may. 

#### Census of Population and Housing, 2000

- Data are sourced from U.S. Bureau of the Census (2006), but is only the Alaska subset.
- The data are only used in the linked computational example  [labordynamicsinstitute/test-part-1-2](https://github.com/labordynamicsinstitute/test-part-1-2)
- Statement about rights:

> The public-use data files in this collection are available for access by the general public. Access does not require affiliation with an ICPSR member institution.

- Data files:
```
test-part-1-2/data/icpsr/ICPSR_13568-V1.zip
```

#### Census of Population and Housing, 2010 - Summary File 1

- Data are sourced from U.S. Bureau of the Census (2010) via the Census Bureau's API, for instance
  - https://api.census.gov/data/2010/dec/sf1?get=P013001%2CNAME&for=state%3A%2A
  - See [part3.Rmd](part3.Rmd) for more details.
- Data are in the public domain. 
- Some data may be provided as part of the repository once it is run.



Computational requirements
---------------------------

> INSTRUCTIONS: In general, the specific computer code used to generate the results in the article will be within the repository that also contains this README. However, other computational requirements - shared libraries or code packages, required software, specific computing hardware - may be important, and is always useful, for the goal of replication. Some example text follows. 

> INSTRUCTIONS: We strongly suggest providing setup scripts that install/set up the environment. Sample scripts for [Stata](https://github.com/gslab-econ/template/blob/master/config/config_stata.do),  [R](https://github.com/labordynamicsinstitute/paper-template/blob/master/programs/global-libraries.R),  [Python](https://pip.readthedocs.io/en/1.1/requirements.html), [Julia](https://github.com/labordynamicsinstitute/paper-template/blob/master/programs/packages.jl) are easy to set up and implement.

### Software Requirements

- Stata is referenced, but no Stata code is needed to produce the slides. Stata 17 was used to generate data stored as part of  [labordynamicsinstitute/test-part-1-2](https://github.com/labordynamicsinstitute/test-part-1-2), with no external dependencies.
- R, in particular using `rmarkdown`, `tidyverse` (Wickham, 2019) and components, and `tidycensus` (Walter and Herman, 2021).

```
R version 4.0.5 (2021-03-31)
Platform: x86_64-pc-linux-gnu (64-bit)
Running under: Ubuntu 20.04.2 LTS

Matrix products: default
BLAS/LAPACK: /usr/lib/x86_64-linux-gnu/openblas-pthread/libopenblasp-r0.3.8.so

locale:
 [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
 [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
 [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=C             
 [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
 [9] LC_ADDRESS=C               LC_TELEPHONE=C            
[11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] tictoc_1.0.1    rprojroot_2.0.2 devtools_2.4.1  usethis_2.0.1  
 [5] forcats_0.5.1   stringr_1.4.0   dplyr_1.0.6     purrr_0.3.4    
 [9] readr_1.4.0     tidyr_1.1.3     tibble_3.1.2    ggplot2_3.3.3  
[13] tidyverse_1.3.1 tidycensus_1.1 
```
  - All binary versions of packages are installed from https://packagemanager.rstudio.com/all/2021-10-01+Y3JhbiwyOjQ1MjYyMTU7NDJGRDU3MTc

### Memory and Runtime Requirements

#### Summary

Approximate time needed to reproduce the analyses on a standard (CURRENT YEAR) desktop machine:

- [ ] <10 minutes
- [x] 10-60 minutes
- [ ] 1-8 hours
- [ ] 8-24 hours
- [ ] 1-3 days
- [ ] 3-14 days
- [ ] > 14 days
- [ ] Not feasible to run on a desktop machine, as described below.

#### Details

The code was last run on a **AMD Ryzen 9 3900X 12-Core Processor** with 32GB of RAM (but that's overkill). Also regularly run on a cloud-based VM using a **Intel(R) Xeon(R) CPU E5-2673 v4 @ 2.30GHz**, which took 2m25s.

The operating system should not be relevant if using Docker:

- Docker 20.10.9-ce, build 79ea9d308018 (to build Docker image)
- Ubuntu 20.04.2 LTS (Focal Fossa)
- Docker image https://hub.docker.com/r/larsvilhuber/reproducibility-confidential:v2021-10-29

Building the image can take up to 15 minutes.


Description of programs/code
----------------------------

All code here is embedded in Rmarkdown documents. 


###  License for Code

The code is licensed under a BSD license. See [LICENSE.txt](LICENSE.txt) for details.


Instructions to Replicators
---------------------------

- To successfully run the [part3.Rmd](part3.Rmd), a Census API Key must be requested, see [Basic usage of tidycensus](https://walker-data.com/tidycensus/articles/basic-usage.html). 
  - In my case, I manually ran `census_api_key("YOUR API KEY GOES HERE",install=TRUE)` the first time (which will work). 
  - For cloud computing, a Github secret was set using `gh secret set -b $CENSUS_API_KEY CENSUS_API_KEY` where the environment variable `$CENSUS_API_KEY` was appropriately set.
  - For later local computing, Docker was started with the environment variable set.
  - To run interactively, run `start_rstudio.sh` (linux, MacOS) and connect to http://localhost:8787. 
  - To produce all slides locally, run
```
docker run -it --rm -e CENSUS_API_KEY -v $(pwd):/github/workspace -w /github/workspace $dockerspace/$repo ./_build.sh
```
  - To produce all slides remotely, enable Github Actions, set the Github secret, and make a commit.




## References

- Kyle Walker and Matt Herman (2021). tidycensus: Load US Census
  Boundary and Attribute Data as 'tidyverse' and 'sf'-Ready Data
  Frames. R package version 1.1. https://walker-data.com/tidycensus/
- Wickham et al., (2019). Welcome to the tidyverse. Journal of Open
  Source Software, 4(43), 1686, https://doi.org/10.21105/joss.01686
- United States. Bureau of the Census. "Census of Population and Housing, 2000 [United States]:  Public Use Microdata Sample:  5-Percent Sample."  ICPSR  [distributor], 2006-01-12. https://doi.org/10.3886/ICPSR13568.v1
- United States. Bureau of the Census. "Census of Population and Housing, 2010 [United States]: Summary File 1." Department of Commerce [distributor], 2010. https://doi.org/10.3886/ICPSR34746.v1
