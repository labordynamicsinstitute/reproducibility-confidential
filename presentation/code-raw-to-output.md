# Code from raw data to output

## The non-negotiable

The package must run **from raw inputs to every number in the paper** — no manual steps, no hand edits.

- Every table, figure, and in-text statistic produced by code
- `estout`, `graph export`, `regsave` — never copy-paste from the console
- One entry point (`run.sh` / `main.do`) that runs it all, top to bottom

## "Raw" means raw

- Start from the data as you received it
- Document every transformation in code
- If a step can't run outside the enclave, the code still shows what it did
