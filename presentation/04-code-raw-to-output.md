## Code from raw data to output


## Files {transition="fade"}

Contents of a package (context: FSRDC)

::::: {.columns}
:::: {.column width="60%"}

```{.bash}
README.md
README.pdf
code/
  fsrdc/
    01-prepare-data.R
    02-analyze-data.R
    03-create-disclosable-data.R
  public/
    04-create-tables.do
    05-create-figures.do
    06-create-intext.do
data/
  public/
    dist_cepii.dta
    usa_00010.dta
run.sh
```

::::
::::{.column width="40%"}

```{.bash}
data/
  confidential/
    lbd_2001.dta
    icf_2024.dta
```

::::
:::::

## The non-negotiable

The package must run **from raw inputs to every number in the paper** — no manual steps, no hand edits.

- Every table, figure, and in-text statistic produced by code
- `estout`, `graph export`, `regsave` — never copy-paste from the console
- Ideally, **one** (or a small number) of entry points (`run.sh` / `main.do`) that runs it all, top to bottom

## Data cleaning code

**All code**, whether used in RDC or not, that was used to manipulate the raw data.

## Data cleaning code

::::: {.columns}
::::{.column width="60%"}


```{.bash code-line-numbers="4-5"}
README.md
README.pdf
code/
  fsrdc/
    01-prepare-data.R
    02-analyze-data.R
    03-create-disclosable-data.R
  public/
    04-create-tables.do
    05-create-figures.do
    06-create-intext.do
run.sh
```

::::
::::{.column width="40%"}

```{.bash code-line-numbers="1"}
data/
  public/
    dist_cepii.dta
    usa_00010.dta
  confidential/
    lbd_2001.dta
    icf_2024.dta
```

::::
:::::

## Data cleaning code

Or maybe there is more code...

::::: {.columns}
::::{.column width="60%"}


```{.bash code-line-numbers="4-8"}
README.md
README.pdf
code/
  01-public/
    01-prepare-cepii.do
    02-prepare-ipums.do
  02-fsrdc/
    01-prepare-data.R
    02-analyze-data.R
    03-create-disclosable-data.R
  03-public/
    04-create-tables.do
    05-create-figures.do
    06-create-intext.do
run.sh
```

::::
::::{.column width="40%"}

```{.bash code-line-numbers="1"}
data/
  public/
    dist_cepii.dta
    usa_00010.dta
  confidential/
    lbd_2001.dta
    icf_2024.dta
```

::::
:::::

## Data cleaning code can be tricky!

We will get back to that!


## Analysis code

**All code**, whether used in RDC or not

::::: {.columns}
::::{.column width="60%"}


```{.bash code-line-numbers="4,6"}
README.md
README.pdf
code/
  fsrdc/
    01-prepare-data.R
    02-analyze-data.R
    03-create-disclosable-data.R
  public/
    04-create-tables.do
    05-create-figures.do
    06-create-intext.do
run.sh
```

::::
::::{.column width="40%"}

```{.bash code-line-numbers="1"}
data/
  public/
    dist_cepii.dta
    usa_00010.dta
  confidential/
    lbd_2001.dta
    icf_2024.dta
```

::::
:::::



## Figures and Tables

Create all **final figures and tables** outside the RDC!

Why?

- You do not want to go back just to change the layout!
- Figures are more time-intensive to disclose

## Figures and Tables

::::: {.columns}
::::{.column width="60%"}


```{.bash code-line-numbers="4,7-11"}
README.md
README.pdf
code/
  fsrdc/
    01-prepare-data.R
    02-analyze-data.R
    03-create-disclosable-data.R
  public/
    04-create-tables.do
    05-create-figures.do
    06-create-intext.do
run.sh
```

::::
::::{.column width="40%"}

```{.bash code-line-numbers="1"}
data/
  public/
    dist_cepii.dta
    usa_00010.dta
  confidential/
    lbd_2001.dta
    icf_2024.dta
```

::::
:::::


## A note or two

- It helps to keep these distinct phases, including the disclosure-prep stage, in mind when writing code
- Separating into different phases of the **final** processing flow can help with organization
- It also makes disclosure avoidance easier