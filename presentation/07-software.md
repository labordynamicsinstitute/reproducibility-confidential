# Software

## Record software versions

- Main software (`Stata 17, R 4.5.3, Python 3.12.5`)
- All packages, with versions
  - not always possible in Stata
- Where did you get them — CRAN, PyPI, SSC, a GitHub repo?
- Pin versions where the language allows it
  - not always possible in Stata...

## Record your dependencies

- Stata:
  - [`creturn list`](https://github.com/AEADataEditor/replication-template/blob/master/template-config.do#L162)
  - `which <pkgname>`
- R:
  - `sessionInfo()`
  - `installed.packages()`

## Where did they come from?

- Provide installation **code** (not manual instructions)
- But do not constantly re-install
  - Conditional processing of install code: if package not present, install; else skip
  - Example code: [AEA replication template](https://github.com/AEADataEditor/replication-template/blob/master/template-config.do#L176)

## Use environments

Project-local package environments keep one (sub-)project from breaking another, and travel with your code.

- See the full walkthrough (incl. Stata):
  [Creating environments](https://larsvilhuber.github.io/self-checking-reproducibility/10-creating-environments.html)
