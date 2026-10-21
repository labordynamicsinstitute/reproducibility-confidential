(provenance)=
# Keeping on top of provenance

- Licenses
- Permissions

## Licenses

### Where does the file come from?

- How can we describe this later to somebody?
  - Point and click is long to describe.
  - What are the rights we have?

### What is a license?

A license (licence) is an official permission or permit to do, use, or own something (as well as the document of that permission or permit).[^2] [^3]

[^2]: [Cambridge dictionary](https://dictionary.cambridge.org/dictionary/english/licence?a=british)
[^3]: [Wikipedia](https://en.wikipedia.org/wiki/License)

Examples:

- [Creative Commons licenses](https://creativecommons.org/licenses/), used for artistic products and data
- [Open Source licenses](https://opensource.org/licenses) (BSD, GPL, MIT, etc.), used for software (code)

License applying to Geodist data:

- CEPII GeoDist is under an [“Etalab 2.0 license”](https://www.etalab.gouv.fr/wp-content/uploads/2018/11/open-licence.pdf)

### Can we re-publish the file?

Based on the information in the **licenses** you agreed to, the **data use agreements (DUA)** you signed, the **non-disclosure agreements (NDA)**, the **legal environment** that you are subject to (GDPR etc.), the **institutional review board (IRB)** permission that you obtained, you must identify early on whether you will be able publish some or all of the data you use.

In some environments, such as RDCs, this decision is not yours anyway, because the institution running your RDC is the custodian and controller of the data. But in other environments, you become the custodian, subject to those rules and agreements, and may be the one who controls the output. 

## Recording information

- [Template README](https://social-science-data-editors.github.io/template_README/template-README.html)
  - Cite both dataset and working paper.
  - Add data URL and time accessed (can you think of a way to automate this?).
  - Add a link to license (also: download and store the license).

## How to process data from the source

If you are yourself collecting data, we suggest you review 
[Preserving raw survey data early in research lifecycle (ethically!)](https://labordynamicsinstitute.github.io/tutorial-preserving-survey/presentation/). However, similar techniques are valid when you "collect" administrative or confidential data. You may want to use **checksums** or similar mechanisms to identify the data sources you were provided with, to allow others in the future to verify that they have been provided with the same data that you had.
