# Computational requirements

## Computer requirements

In most confidential environments, such as FSRDC/ IRE, this part is out of your control. But describe it anyway!

## Computer requirements

- Approximate description of computers/nodes used
  - memory size (but interested in actual usage, not max of what the system has!)
  - compute time! How long does a clean run, from top to bottom, take?
  - number of nodes: any parallel processing?
- Software
  - Version of software (Stata 17, update level)
  - All packages! Ideally, version of package (`which estout`)

## Computer requirements (FSRDC)

- Did you use PBS? Sure you did.

Include the `qsub` files! (Or if you used `qstata` or such, describe that).

```{.bash code-line-numbers="3"}
...
run.sh
qsub-complete.sh
```
