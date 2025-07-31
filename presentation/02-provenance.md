# Keeping on top of provenance

- Licenses
- Streamlining for reproducibility

# Licenses

## Where does the file come from?

- How can we describe this later to somebody? 
  - Point and click is long to describe
  - What are the rights we have? 

## What is a license?

> A license (licence) is an official permission or permit to do, use, or own something (as well as the document of that permission or permit).[^source1] [^source2]

[^source1]: [Cambridge Dictionary](https://dictionary.cambridge.org/dictionary/english/licence?a=british)
[^source2]: [Wikipedia](https://en.wikipedia.org/wiki/License)

## Examples

- [Creative Commons licenses](https://creativecommons.org/licenses/), used for artistic products and data
- [Open Source licenses](https://opensource.org/licenses) (BSD, GPL, MIT, etc.), used for software (code)

## License applying to Geodist data

- CEPII GeoDist is under an "[Etalab 2.0 license](https://www.etalab.gouv.fr/wp-content/uploads/2018/11/open-licence.pdf)"

## Can we re-publish the file?

# Downloading via code

## Easiest:

**Stata**

```{.stata}
use "$URL" , clear
```

## Why not?

- will it be there in two months? in 6 years?
- what if the internet connection is down?

## Easy:

**Stata**

```{.stata}
global URL "https://www.cepii.fr/distance/dist_cepii.dta"
copy "$URL" (outputfile), replace
```

**R**

```{.r}
download.file(url="$URL",destfile="(outputfile)")
```

## We will get to even better methods a bit later

# Creating a README

- [Template README](https://social-science-data-editors.github.io/template_README/template-README.html)
  - Cite both dataset and working paper
  - Add data URL and time accessed (can you think of a way to automate this?)
  - Add a link to license (also: download and store the license)


## Link

Step 1: [Stata](https://drive.google.com/file/d/10IH2TCnckH8TLeZ0P6cJlVgpyrqC4Q3L/view?usp=sharing), [R](https://drive.google.com/file/d/10_pxEathhgIhxdYl2YFZVhv3oaPgJt2u/view?usp=drive_link) [^fallback1]

[^fallback1]: [🔒Tag: stage1](https://github.com/codedthinking/day1/tree/stage1)
