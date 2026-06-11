# Versioning

## If you can, use `git`

- Use `git` (or any VCS) for code from the very first line
- Commit early, commit often, with messages your future self can read
- You do **NOT** need the internet to use `git`! 

## Not a `git` convert?

Some RDCs have **no git**. You can still version:

- Keep a dated, append-only changelog in the README
- Take manual snapshots (rename, copy into directories, etc.)

## Manual versioning method

- Do NOT use `mycode-final_FINAL.R` to be the code you are working on!
- Rather, if `01-prepare-data.R` is your code, then back up to `01-prepare-data-2024-06-01.R`.
- Or: zip it all up into `code-2024-06-01.zip` and copy the zip files into an `archive` folder

## Manual versioning method

- **Better**: script it! Using whatever tools you are comfortable with. 

```{.bash}
# This is archive.sh
date=$(date +%Y-%m-%d)
archive_dir="archive"
mkdir -p "$archive_dir"
zip -rp "$archive_dir/code-$date-$(whoami).zip" code/
```

## Manual versioning method {transition="fade" }

- **Better**: script it! Using whatever tools you are comfortable with. 

```{.bash}
...
archive/
    code-2024-06-01-vilhu001.zip
    code-2024-06-15-jarmin001.zip
``` 

## What versioning buys you

- A way to answer "*what changed since the last disclosure request?*"
- Confidence to delete dead code (it's in history)
- A second researcher can pick up exactly where you left off
- You know exactly what you sent to the DRB! (or the journal!)

## But...

> Please do learn `git`! 

Go do the [Carpentries' Git lesson](https://swcarpentry.github.io/git-novice/)


