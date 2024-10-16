
# The README


## Three parts to README

- Data availability (and citations)
- Computer requirements
- Description of processing

## Start with the last part

That's easy: you've been keeping clean instructions since the start, right?

- Run "`main.do`" or `run.sh`
- Describe what parts might be skipped
- Describe what the various parts do
- Describe which parts use confidential data

You've been doing that **since day 1!**

## Computer requirements

In most confidential environments, such as FSRDC/ IRE, this part is out of your control. But describe it anyway!



## Computer requirements

- Approximate description of computers/nodes used
  - memory size (but interested in actual usage, not max of what the system has!)
  - compute time! How long does a clean run, from top to bottom, take?
  - number of nodes: any parallel processing?
- Software
  - Version of software (Stata 17, update level)
  - All packages! Ideally, version of package (`which estout`)

## Computer requirements (FSRDC)

- Did you use PBS? Sure you did.

Include the `qsub` files! (Or if you used `qstata` or such, describe that).

```{.bash code-line-numbers="3"}
...
run.sh
qsub-complete.sh
```


## Data availability

- This is easy: it's the data you requested to have included in your FSRDC project!
- So you had this info from **Day -90** of the project!

## Data availability redux

In order to describe data availability, split into two: 

- how did YOU get access to the data (that's old) 
- how can OTHERS get access to the same data (that might be different!)
- The two are not always the same, but are both relevant. 

## Examples {transition="fade" .smaller}

Examples include 

- [this excellent description](https://social-science-data-editors.github.io/guidance/DCAS_Restricted_data.html#us-census-bureau-and-fsrdc) from a paper by [Teresa Fort](https://faculty.tuck.dartmouth.edu/teresa-fort/) ([ReStud](https://doi.org/10.1093/restud/rdw057)):

## Examples {transition="fade" .smaller}

Examples include 

- [this excellent description](https://social-science-data-editors.github.io/guidance/DCAS_Restricted_data.html#us-census-bureau-and-fsrdc) from a paper by [Teresa Fort](https://faculty.tuck.dartmouth.edu/teresa-fort/) ([ReStud](https://doi.org/10.1093/restud/rdw057)):


> 1. All the results in the paper use confidential microdata from the U.S. Census Bureau. To gain
access to the Census microdata, follow the directions here on how to write a proposal for access
to the data via a Federal Statistical Research Data Center:
https://www.census.gov/ces/rdcresearch/howtoapply.html.
> -

## Examples {transition="fade" .smaller}

Examples include 

- [this excellent description](https://social-science-data-editors.github.io/guidance/DCAS_Restricted_data.html#us-census-bureau-and-fsrdc) from a paper by [Teresa Fort](https://faculty.tuck.dartmouth.edu/teresa-fort/) ([ReStud](https://doi.org/10.1093/restud/rdw057)):

> 2. You must request the following datasets in your proposal:
>   - Longitudinal Business Database (LBD), 2002 and 2007
>   - Foreign Trade Database – Import (IMP), 2002 and 2007
>   - Annual Survey of Manufactures (ASM), including the Computer Network Use      Supplement (CNUS), 1999
>   - [...]
>   - Annual Survey of Magical Inputs (ASMI), 2002 and 2007

## Examples {transition="fade" .smaller}

Examples include 

- [this excellent description](https://social-science-data-editors.github.io/guidance/DCAS_Restricted_data.html#us-census-bureau-and-fsrdc) from a paper by [Teresa Fort](https://faculty.tuck.dartmouth.edu/teresa-fort/) ([ReStud](https://doi.org/10.1093/restud/rdw057)):


> 3. Reference “Technology and Production Fragmentation: Domestic versus Foreign   Sourcing” by Teresa Fort, project number br1179 in the proposal. This will give you access to   the programs and input datasets required to reproduce the results. Requesting a search of archives   with the articles DOI ("10.1093/restud/rdw057") should yield the same results. 
> -

## Examples {transition="fade" .smaller}

Examples include 

- [this excellent description](https://social-science-data-editors.github.io/guidance/DCAS_Restricted_data.html#us-census-bureau-and-fsrdc) from a paper by [Teresa Fort](https://faculty.tuck.dartmouth.edu/teresa-fort/) ([ReStud](https://doi.org/10.1093/restud/rdw057)):

>   NOTE: Project-related files are available for 10 years as of 2015. 


## Examples {transition="fade" .smaller}

Examples include 

- [this description](https://social-science-data-editors.github.io/guidance/Requested_information_dcas.html#example-for-confidential-data) by Fadlon and Nielsen about Danish data

> The information used in the analysis combines several Danish administrative registers (as described in the paper). The data use is subject to the European Union’s General Data Protection Regulation(GDPR) per new Danish regulations from May 2018. The data are physically stored on computers at Statistics Denmark and, due to security considerations, the data may not be transferred to computers outside Statistics Denmark. 

## Examples {transition="fade" .smaller}

Examples include 

- [this description](https://social-science-data-editors.github.io/guidance/Requested_information_dcas.html#example-for-confidential-data) by Fadlon and Nielsen about Danish data

> Researchers interested in obtaining access to the register data employed in this paper are required to submit a written application to gain approval from Statistics Denmark. The application must include a detailed description of the proposed project, its purpose, and its social contribution, as well as a description of the required datasets, variables, and analysis population. 

## Examples {transition="fade" .smaller}

Examples include 

- [this description](https://social-science-data-editors.github.io/guidance/Requested_information_dcas.html#example-for-confidential-data) by Fadlon and Nielsen about Danish data

> Applications can be submitted by researchers who are affiliated with Danish institutions accepted by Statistics Denmark, or by researchers outside of Denmark who collaborate with researchers affiliated with these institutions.

(Example taken from [Fadlon and Nielsen, AEJ:Applied 2021](https://doi.org/10.1257/app.20170604)).


## Examples {.smaller transition="fade" } 

Also grant permission to your project files:

> I grant any researchers with appropriate Census-approved project permission to use my exact research files provided that those files were among the ones that they requested when the approval was obtained (a Census Bureau requirement). These files can be found by searching for the DOI of 
[this archive/ this article] amongst backups/archives made in [month of archive].

## Don't forget to cite the data {.smaller}

> Bureau of the Census. (release year). American Community Survey-Master Address File Crosswalk YYYY-YYZZ [Data File]. Federal Statistical Research Data Center [distributor].
> 
> Graf, Tobias; Grießemer, Stephan; Köhler, Markus; Lehnert, Claudia; Moczall, Andreas; Oertel, Martina; Schmucker, Alexandra; Schneider, Andreas; Seth, Stefan; Thomsen, Ulrich; vom Berge, Philipp (2023): "Weakly anonymous Version of the Sample of Integrated Labour Market Biographies (SIAB) – Version 7521 v1". Research Data Centre of the Federal Employment Agency (BA) at the Institute for Employment Research (IAB). <https:/doi.org/10.5164/IAB.SIAB7521.de.en.v1>


- Further examples on [Zotero for FSRDC](https://www.zotero.org/groups/2245704/fsrdc) (possibly not the most current).
- Ideally, every research data center would have  "landing pages" for the data (the IAB example does)



## Three parts to README: timing

| | |
|---------|----------|
|- Data availability (and citations):|**Start of project, edit at the end**|
|- Computer requirements: | Middle of project|
|- Description of processing: | Middle of project|
| | |

with the end really just a last read/edit.

