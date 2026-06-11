# File organization

## A predictable place for everything

The replication package layout *is* your working layout — adopt it from day 1:

```{.bash}
README.md
code/
  fsrdc/      # runs inside the enclave
  public/     # runs anywhere
data/
  confidential/   # never leaves the enclave
  public/         # publishable
run.sh
```

## Why?

- Separating `confidential/` from `public/` makes disclosure easy
- Separating `code/fsrdc/` from `code/public/` shows what runs where
- A single `run.sh` documents the order of operations

## Simplicity

> If you can tell, from the path alone, whether a file can be released, you have organized well.

... and your *FSRDC disclosure officer* will be happy!