(confidential-data-packaging)=
# Preserving replication packages

Public replication packages are **preserved** by journals or trusted archives.

What to do with the confidential data?

## Replication package as a puzzle

![Puzzle](images/85458-play-toy-puzzle-jigsaw-puzzles-photography-stock-208484027.png)

Treat the **full** replication package as a puzzle:

- The public package (`A`) is one piece, containing code, public data, and documentation
- The confidential data (`B`) is the **missing piece** that completes the picture, and stays in the RDC

## Releasing the public package

The public package (`A`):

```text
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
data/
  public/
    dist_cepii.dta
    usa_00010.dta
```

## Preserve the confidential data that you created

- intermediate outputs
- confidential final files
- confidential parameters

The confidential package (`B`), which stays in the RDC:

```text
README.md
README.pdf
code/
  confidential/
    conf-parms.R
data/
  confidential/
    lbd_2001.dta
    icf_2024.dta
```

## Replicators can combine both

```bash
unzip A.zip -d replication-of-lars/
unzip B.zip -d replication-of-lars/
```

## Preservation inside the RDC

- As in the Fort package, leverage **internal backup procedures**
- Some RDCs may also have an *explicit preservation policy* (to comply with public access laws?)
- The likely retention period (or lack thereof) must be noted in the (public) README.
- Information on how to find the confidential `B.zip` must be included in the **public** README.
