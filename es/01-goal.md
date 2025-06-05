# El paquete de replicación final

## Archivos {transition="fade"}

Contenido de un paquete

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

## Archivos {transition="fade" }

**Todo el código**, ya sea usado en RDC o no

```{.bash code-line-numbers="3-11,16"}
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

## Archivos {transition="fade" }

**Todos los datos públicos**, ya sean usados en RDC o no

```{.bash code-line-numbers="12-15"}
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

## Contenido

::::: {.columns}

:::: {.column width="50%"}

Descripción completa según la [(plantilla) README](https://social-science-data-editors.github.io/template_README/)

::::

:::: {.column width="30%"} 
[![README](/images/img-2021-11-08-2.png)](https://social-science-data-editors.github.io/template_README/)

::::
:::::
