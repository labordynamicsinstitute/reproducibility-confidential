# Disclosure avoidance: plan for it

## Plan from day -90, not day 365

Disclosure review is not a last-minute chore — design for it:

- Decide early what is confidential: variables, paths, parameters, code
- Keep confidential things in clearly separated, excludable files
- Assume **someone will read your code** — because they will

## A plan looks like

- A `confidential/` folder that is never disclosed
- Conditional processing: run on confidential data *if present*, else use saved releasable outputs
- A disclosure request that includes the **code**, not just the numbers

## Pays off

- Faster disclosure review (fewer surprises, fewer changes)
- A package you can release the day the paper is accepted
