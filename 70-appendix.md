(appendix)=
# Appendix

## Exercise 1

### Tell me about these data

For each of the datasets, answer the following questions:

1. Do you have to **agree** in some fashion to a data use agreement? If yes, how?
2. Can you **download** the data today?
3. Can you **share** it with your team members?
4. Can you **include** the data in the replication package?
5. How would you go about **preserving** the data you used for reproducibility and replicability?

**Group 1**

- [G]SOEP - start at <https://paneldata.org/soep-core/>
- PSID - start at <https://simba.isr.umich.edu/data/data.aspx>
- NSLY - <https://www.nlsinfo.org/content/getting-started/accessing-data>

**Group 2**

- Current Population Survey (CPS) - start at <https://www.census.gov/programs-surveys/cps/data.html>
- HRS - start at <https://hrs.isr.umich.edu/data-products>
- World Values Survey - start at <https://www.worldvaluessurvey.org/WVSDocumentationWV7.jsp>

**Group 3**

- Current Population Survey (CPS) via IPUMS - start at <https://cps.ipums.org/cps/>
- Health-Related Microdata for Low- and Middle-Income Countries <https://www.idhsdata.org/idhs/>
- Distance between pairs of countries - <https://www.google.com/search?client=firefox-b-e&channel=entpr&q=CEPII+GeoDist>

## Exercise 2

### Downloading data via code

Easiest:

**Stata**

```stata
use "$URL" , clear
```

Why not?

- Will it be there in two months? In six years?
- What if the internet connection is down?

Easy:

**Stata**

```stata
global URL "https://www.cepii.fr/distance/dist_cepii.dta"
copy "$URL" (outputfile), replace
```

**R**

```R
download.file(url="$URL",destfile="(outputfile)")
```

What if the internet dies? Use caching of downloaded data.

```stata
// ::::  Process only if data are present 

capture confirm  file "${datapath}/dist_cepii.dta"
if _rc == 0 {
    di in green "Data file is present, processing data"
} else { 
    di in red "Downloading data" 
    copy "$URL" "${datapath}/dist_cepii.dta", replace
}

//============ at this point, the data is available ======
// ::::  Process always 

use "${datapath}/dist_cepii.dta", clear
// do stuff....
```

That was easy! On to confidential data!

## Environments in Stata

See [](environments-in-stata).

## Links

Some additional guidance can be found on the website of the Social Science Data Editors (URLs subject to change):

- <https://social-science-data-editors.github.io/guidance/DCAS_Restricted_data.html#us-census-bureau-and-fsrdc>
- <https://social-science-data-editors.github.io/guidance/Requested_information_hosting.html#self-generated-repositories>

## Additional training resources

- “Day 1 Tutorial”: Presented on Sept 12, 2024 at FSRDC conference (pre-program), subject to change: <https://larsvilhuber.github.io/day1-tutorial/>
- General purpose guidance about “self checking” your reproducibility package: <https://larsvilhuber.github.io/self-checking-reproducibility/>

## Examples of replication packages

- <https://doi.org/10.3886/E154241V2> not only code, but faces the problem that IRS data cannot have variables revealed. Their workaround is not the same one as in this tutorial.
- <https://doi.org/10.3886/E162581V1>

This textbook's source: <https://github.com/labordynamicsinstitute/reproducibility-confidential>

Licensed under [![CC BY-NC 4.0](images/cc-by-nc-80x15.png)](https://creativecommons.org/licenses/by-nc/4.0/)
