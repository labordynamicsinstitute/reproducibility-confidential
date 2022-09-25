# FSRDC conference: Working with confidential data



Prepared for presentation at 
the 2022 FSRDC Conference.

## Creating Presentation Slides

This presentation is about reproducibility, and it is created in a reproducible way. This README describes how, using the [template README](https://social-science-data-editors.github.io/template_README/).

Data Availability and Provenance Statements
----------------------------

### Statement about Rights

- [x] I certify that the author(s) of the manuscript have legitimate access to and permission to use the data used in this manuscript. 

### Summary of Availability

- [x] No data involved
- [ ] All data **are** publicly available.
- [ ] Some data **cannot be made** publicly available.
- [ ] **No data can be made** publicly available.



Computational requirements
---------------------------

> INSTRUCTIONS: In general, the specific computer code used to generate the results in the article will be within the repository that also contains this README. However, other computational requirements - shared libraries or code packages, required software, specific computing hardware - may be important, and is always useful, for the goal of replication. Some example text follows. 

> INSTRUCTIONS: We strongly suggest providing setup scripts that install/set up the environment. Sample scripts for [Stata](https://github.com/gslab-econ/template/blob/master/config/config_stata.do),  [R](https://github.com/labordynamicsinstitute/paper-template/blob/master/programs/global-libraries.R),  [Python](https://pip.readthedocs.io/en/1.1/requirements.html), [Julia](https://github.com/labordynamicsinstitute/paper-template/blob/master/programs/packages.jl) are easy to set up and implement.

### Software Requirements

- Stata is referenced, but no Stata code is needed to produce the slides. 
- R, in particular using `rmarkdown`. See `setup.R`.
  - All binary versions of packages are installed from https://packagemanager.rstudio.com/all/2021-10-01+Y3JhbiwyOjQ1MjYyMTU7NDJGRDU3MTc

### Memory and Runtime Requirements

#### Summary

Approximate time needed to reproduce the analyses on a standard (CURRENT YEAR) desktop machine:

- [x] <10 minutes
- [ ] 10-60 minutes
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

- To run interactively, run `start_rstudio.sh` (linux, MacOS) and connect to http://localhost:8787. 
- To produce all slides locally, run
```
docker run -it --rm -v $(pwd):/github/workspace -w /github/workspace $dockerspace/$repo ./_build.sh
```
  - To produce all slides remotely, enable Github Actions, and make a commit.




## References

