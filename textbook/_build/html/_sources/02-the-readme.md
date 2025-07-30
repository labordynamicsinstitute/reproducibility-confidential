(the-readme)=
# The README

There are three key components to the README file:
- Data availability (and citations)
- Computer requirement 
- Description of processing

## Description of processing
That's easy: you've been keeping clean instructions since the start, right?

- Run `main.do` or `run.sh`
- Describe what parts might be skipped
- Describe what the various parts do
- Describe which parts use confidential data

You've been doing that **since day 1!**

## Data availability
This is easy: it's the data you requested to have included in your FSRDC project. So you had this info from **day -90** of the project!

In order to describe the data availability, split it into two:
- how did **you** get access to the data (that's old)
- how can **others** get access to the same data (this might be different!)

The above two might not always be the same, but both are relevant.

### Examples
- This excellent description from a paper by [Teresa Fort](https://faculty.tuck.dartmouth.edu/teresa-fort/) ([ReStud](https://academic.oup.com/restud/article-abstract/84/2/650/2687762?redirectedFrom=fulltext&login=false)):
  1. All the results in the paper use confidential microdata from the U.S. Census Bureau. To gain access to the Census microdata, follow the 
     directions here on how to write a proposal for access to the data via a Federal Statistical Research Data Center: 
     https://www.census.gov/ces/rdcresearch/howtoapply.html.
  2. You must request the following datasets in your proposal:
     - Longitudinal Business Database (LBD), 2002 and 2007
     - Foreign Trade Database – Import (IMP), 2002 and 2007
     - Annual Survey of Manufactures (ASM), including the Computer Network Use Supplement (CNUS), 1999
     - [...]
     - Annual Survey of Magical Inputs (ASMI), 2002 and 2007
   3. Reference
      - “Technology and Production Fragmentation: Domestic versus Foreign Sourcing” by Teresa Fort, project number br1179 in the proposal. This will 
       give you access to the programs and input datasets required to reproduce the results. Requesting a search of archives with the articles DOI 
       (“10.1093/restud/rdw057”) should yield the same results.

      NOTE: Project-related files are available for 10 years as of 2015.

- [This description](https://social-science-data-editors.github.io/guidance/Guidance/Requested_information_dcas.html) by Fadlon and Nielsen about Danish data
  - The information used in the analysis combines several Danish administrative registers (as described in the paper). The data use is subject to 
    the European Union’s General Data Protection Regulation(GDPR) per new Danish regulations from May 2018. The data are physically stored on 
    computers at Statistics Denmark and, due to security considerations, the data may not be transferred to computers outside Statistics Denmark.

    Researchers interested in obtaining access to the register data employed in this paper are required to submit a written application to gain 
    approval from Statistics Denmark. The application must include a detailed description of the proposed project, its purpose, and its social 
    contribution, as well as a description of the required datasets, variables, and analysis population.

    Applications can be submitted by researchers who are affiliated with Danish institutions accepted by Statistics Denmark, or by researchers 
    outside of Denmark who collaborate with researchers affiliated with these institutions.

(Example taken from [Fadlon and Nielse, AEJ:Applied 2021](https://www.aeaweb.org/articles?id=10.1257/app.20170604)).

- Also grant permission to your project files:
  I grant any researchers with appropriate Census-approved project permission to use my exact research files provided that those files were among 
  the ones that they requested when the approval was obtained (a Census Bureau requirement). These files can be found by searching for the DOI of 
  [this archive/ this article] amongst backups/archives made in [month of archive].

### Don't forget to cite the data
Bureau of the Census. (release year). American Community Survey-Master Address File Crosswalk YYYY-YYZZ [Data File]. Federal Statistical Research Data Center [distributor].

Graf, Tobias; Grießemer, Stephan; Köhler, Markus; Lehnert, Claudia; Moczall, Andreas; Oertel, Martina; Schmucker, Alexandra; Schneider, Andreas; Seth, Stefan; Thomsen, Ulrich; vom Berge, Philipp (2023): “Weakly anonymous Version of the Sample of Integrated Labour Market Biographies (SIAB) – Version 7521 v1”. Research Data Centre of the Federal Employment Agency (BA) at the Institute for Employment Research (IAB). https:/doi.org/10.5164/IAB.SIAB7521.de.en.v1

- Further examples on [Zotero for FSRDC](https://www.zotero.org/groups/2245704/fsrdc) (this is possibly not the most current).
- Ideally, every research data center would have "landing pages" for the data (the IAB example does).

## Computer requirements
In most confidential environments, such as FSRDC/IRE, this part is out of your control. But you should describe it anyway! You should include the approximate description of computer/nodes used. This includes memory size (though we are interested in actual usage, not the maximum of what the system has), and compute time (how long does a clean run, from top to bottom, take?), and number of nodes (any parallel processing?). You should also detail the software used, that is, the version of software (Stata 17, update level), and all packages, ideally version of package (which `estout`).

### FSRDC
Did you use PBS? Include the `qsub` files. Or if you used `qstata` or such, describe that: 

```plain text
...
run.sh
qsub-complete.sh
```

## Three parts to README: timing
- Data availability (and citations) -- start of the project, edit at the end
- Computer requirement -- middle of the project 
- Description of processing -- middle of the project

With the end really just a last read/edit.
