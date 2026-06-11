# What to do with the confidential data

You ship code and *public* data. The confidential data stays in the enclave — but you still package it, deliberately.

## A. Zip the (confidential) replication package

- Archive the **full** package — code, public data, *and* the confidential inputs/outputs — inside the enclave
- This is the archive the RDC keeps; it is what a future replicator with approval will use
- Same structure as the public package, plus `data/confidential/`

## B. Zip the external data separately

- Public/external inputs (e.g. CEPII GeoDist) are not always re-distributable
- Bundle them in a **separate** archive with their provenance and license
- The public package can then point to that archive instead of embedding files you may not redistribute

## Two archives, one structure

- **Public package**: shippable, no confidential data
- **Confidential archive**: everything, stays in the enclave
