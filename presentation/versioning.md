# Versioning, if possible

## Version your code, not your memory

- Use **git** (or any VCS) for code from the very first line
- Commit early, commit often, with messages your future self can read

## Inside the enclave?

Many RDCs have **no git, no internet**. You can still version:

- Keep a dated, append-only changelog in the README
- Use the enclave's file-history / backup if provided
- Carry code *in* via the approved channel; carry *nothing confidential* out

## What versioning buys you

- A way to answer "what changed since the last disclosure request?"
- Confidence to delete dead code (it's in history)
- A second researcher can pick up exactly where you left off
