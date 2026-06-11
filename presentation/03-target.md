# To start at the end

**The final replication package**

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
run.sh
```

::::
::::{.column width="40%"}

```{.bash}
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

## Files {transition="fade" }

**All code**, whether used in RDC or not

::::: {.columns}
::::{.column width="60%"}


```{.bash code-line-numbers="3-12"}
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


## Files {transition="fade" }

**All public data**, whether used in RDC or not

::::: {.columns}
::::{.column width="60%"}


```{.bash code-line-numbers="1"}
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

```{.bash code-line-numbers="1-4"}
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

## Files {transition="fade" }

**NONE of the confidential data** present in the RDC

::::: {.columns}
::::{.column width="60%"}


```{.bash code-line-numbers="1"}
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

```{.bash code-line-numbers="5-7"}
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

