(appendix)=
# Appendix

## Keeping on top of provenance

- Licenses
- Streamlining for reproducibility

### Licenses

Where does the file come from?
- How can we describe this later to somebody?
  - Point and click is long to describe.
  - What are the rights we have?

[^2]: [Cambridge dictionary](https://dictionary.cambridge.org/dictionary/english/licence?a=british)
[^3]: [Wikipedia](https://en.wikipedia.org/wiki/License)
What is a license? A license (licence) is an official permission or permit to do, use, or own something (as well as the document of that permission or permit). [^2] [^3]

Examples:
- [Creative Commons licenses](https://creativecommons.org/licenses/), used for artistic products and data
- [Open Source licenses](https://opensource.org/licenses) (BSD, GPL, MIT, etc.), used for software (code)

License applying to Geodist data
- CEPII GeoDist is under an [“Etalab 2.0 license”](https://www.etalab.gouv.fr/wp-content/uploads/2018/11/open-licence.pdf)


## Downloading via code

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
rootdir <- getwd()
datadir <- paste(rootdir, "data", sep = "/")
```

## Creating a README
- [Template README](https://social-science-data-editors.github.io/template_README/template-README.html)
- Cite both dataset and working paper.
- Add data URL and time accessed (can you think of a way to automate this?).
- Add a link to license (also: download and store the license).

## Links
Some additional guidance can be found on the website of the Social Science Data Editors (URLs subject to change):
- https://social-science-data-editors.github.io/guidance/Guidance/Requested_information_hosting.html
- https://social-science-data-editors.github.io/guidance/DCAS_Restricted_data.html#us-census-bureau-and-fsrdc

## Additional training resources
- “Day 1 Tutorial”: Presented on Sept 12, 2024 at FSRDC conference (pre-program), subject to change: https://larsvilhuber.github.io/day1-tutorial/
- General purpose guidance about “self checking” your reproducibility package: https://larsvilhuber.github.io/self-checking-reproducibility/

## Examples of replication packages
- https://doi.org/10.3886/E154241V2 not only code, but faces the problem that IRS data cannot have variables revealed. Their workaround is not the same one as in this tutorial.
- https://www.openicpsr.org/openicpsr/project/162581/version/V1/view

This textbook's source: https://github.com/labordynamicsinstitute/reproducibility-confidential

Licensed under ![by_cc)](images/cc-by-nc-80x15.png)





