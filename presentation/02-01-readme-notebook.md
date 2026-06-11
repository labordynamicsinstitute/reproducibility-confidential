# The README as a lab notebook

Your README is not paperwork you write at the end — it is the **memory of the project**, kept as you go.


## Helpful template

:::::: {.columns}

::::: {.column width="50%"}

Full description as per the [(template) README](https://social-science-data-editors.github.io/template_README/)

:::::

::::: {.column width="30%"} 
[![README](images/img-2021-11-08-2.png)](https://social-science-data-editors.github.io/template_README/)

:::::
::::::


## Three parts to the README


:::::: {.columns}

::::: {.column width="60%"}

- Data availability, provenance, and citations
- Computer requirements
- Description of processing

:::::
::::: {.column width="40%"} 

Deep dive: 
[README presentation](https://larsvilhuber.github.io/readme-presentation/)

:::::
::::::

## Data provenance

- In the RDC, you know where your **confidential** data comes from!
- Other data must still be described - you may have done that already to bring it in!

## Computer requirements

- You might say 

> "But I did not choose my computer environment! They forced me!"

## Computer requirements

You still need to describe it. 

- You might need to know in a *future* project
- There may be **costs** associated with your specific environment
- Others want to *replicate* your work in a different environment

## Computer requirements

- Memory size
- How many "nodes" (computers)
- Possibly physical disk space
- Runtime (how long does a clean run take?)


## Computer requirements (FSRDC)

- Did you use PBS? Sure you did.

Include the `qsub` files! (Or if you used `qstata` or such, describe that).

```{.bash code-line-numbers="3"}
...
run.sh
qsub-complete.sh
```