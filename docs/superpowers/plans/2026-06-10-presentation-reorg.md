# Presentation Reorganization Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Reorganize the `presentation/` reveal.js deck into a four-section flow (What is the goal → How to get there → What is required → Disclosure avoidance), authoring new slides for gap topics and splitting the bundled `02-readme-fsrdc.md`.

**Architecture:** Quarto/reveal.js deck. `presentation/index.qmd` includes child `.md` files in order and carries `#` section-divider headings as literal markdown. Reorg = create/split child files, then rewrite the include order and dividers in `index.qmd`. No tests in the unit sense; verification = every `index.qmd` include resolves to an existing file, no references to deleted files, and (best-effort) a Quarto render.

**Tech Stack:** Quarto, reveal.js, R (`knitr` child includes), Markdown.

**Branch:** `reorg-presentation-flow` (already created; spec committed there).

**Spec:** `docs/superpowers/specs/2026-06-10-presentation-reorg-design.md`

---

## Conventions for every task

- All slide files live in `presentation/`.
- Existing numbered files are **not renamed**. New files use descriptive slugs.
- Commit after each file with a clear message; the working directory for `git` commands is the repo root `/home/vilhuber/Workspace/LDI/reproducibility-confidential`.

---

### Task 1: Split — create `provenance-private.md`

Lifts the data-availability example blocks out of `02-readme-fsrdc.md` (which is deleted in Task 11).

**Files:**
- Create: `presentation/provenance-private.md`

- [ ] **Step 1: Create the file with this exact content**

````markdown
# Provenance of private data

How did *you* get the data — and how can *others*?

## Data availability

- For FSRDC work: it's the data you requested to have included in your project!
- So you had this info from **Day -90** of the project!

## Data availability redux

In order to describe data availability, split into two:

- how did YOU get access to the data (that's old)
- how can OTHERS get access to the same data (that might be different!)
- The two are not always the same, but are both relevant.

## Examples {transition="fade" .smaller}

Examples include

- [this excellent description](https://social-science-data-editors.github.io/guidance/DCAS_Restricted_data.html#us-census-bureau-and-fsrdc) from a paper by [Teresa Fort](https://faculty.tuck.dartmouth.edu/teresa-fort/) ([ReStud](https://doi.org/10.1093/restud/rdw057)):

## Examples {transition="fade" .smaller}

Examples include

- [this excellent description](https://social-science-data-editors.github.io/guidance/DCAS_Restricted_data.html#us-census-bureau-and-fsrdc) from a paper by [Teresa Fort](https://faculty.tuck.dartmouth.edu/teresa-fort/) ([ReStud](https://doi.org/10.1093/restud/rdw057)):


> 1. All the results in the paper use confidential microdata from the U.S. Census Bureau. To gain
access to the Census microdata, follow the directions here on how to write a proposal for access
to the data via a Federal Statistical Research Data Center:
https://www.census.gov/ces/rdcresearch/howtoapply.html.
> -

## Examples {transition="fade" .smaller}

Examples include

- [this excellent description](https://social-science-data-editors.github.io/guidance/DCAS_Restricted_data.html#us-census-bureau-and-fsrdc) from a paper by [Teresa Fort](https://faculty.tuck.dartmouth.edu/teresa-fort/) ([ReStud](https://doi.org/10.1093/restud/rdw057)):

> 2. You must request the following datasets in your proposal:
>   - Longitudinal Business Database (LBD), 2002 and 2007
>   - Foreign Trade Database – Import (IMP), 2002 and 2007
>   - Annual Survey of Manufactures (ASM), including the Computer Network Use      Supplement (CNUS), 1999
>   - [...]
>   - Annual Survey of Magical Inputs (ASMI), 2002 and 2007

## Examples {transition="fade" .smaller}

Examples include

- [this excellent description](https://social-science-data-editors.github.io/guidance/DCAS_Restricted_data.html#us-census-bureau-and-fsrdc) from a paper by [Teresa Fort](https://faculty.tuck.dartmouth.edu/teresa-fort/) ([ReStud](https://doi.org/10.1093/restud/rdw057)):


> 3. Reference
>   - “Technology and Production Fragmentation: Domestic versus Foreign   Sourcing” by Teresa Fort, project number br1179 in the proposal.
> This will give you access to   the programs and input datasets required to reproduce the results.
> Requesting a search of archives   with the articles DOI ("10.1093/restud/rdw057") should yield the same results.
> -

## Examples {transition="fade" .smaller}

Examples include

- [this excellent description](https://social-science-data-editors.github.io/guidance/DCAS_Restricted_data.html#us-census-bureau-and-fsrdc) from a paper by [Teresa Fort](https://faculty.tuck.dartmouth.edu/teresa-fort/) ([ReStud](https://doi.org/10.1093/restud/rdw057)):

>   NOTE: Project-related files are available for 10 years as of 2015.


## Examples {transition="fade" .smaller}

Examples include

- [this description](https://social-science-data-editors.github.io/guidance/Requested_information_dcas.html#example-for-confidential-data) by Fadlon and Nielsen about Danish data

> The information used in the analysis combines several Danish administrative registers (as described in the paper). The data use is subject to the European Union’s General Data Protection Regulation(GDPR) per new Danish regulations from May 2018. The data are physically stored on computers at Statistics Denmark and, due to security considerations, the data may not be transferred to computers outside Statistics Denmark.

## Examples {transition="fade" .smaller}

Examples include

- [this description](https://social-science-data-editors.github.io/guidance/Requested_information_dcas.html#example-for-confidential-data) by Fadlon and Nielsen about Danish data

> Researchers interested in obtaining access to the register data employed in this paper are required to submit a written application to gain approval from Statistics Denmark. The application must include a detailed description of the proposed project, its purpose, and its social contribution, as well as a description of the required datasets, variables, and analysis population.

## Examples {transition="fade" .smaller}

Examples include

- [this description](https://social-science-data-editors.github.io/guidance/Requested_information_dcas.html#example-for-confidential-data) by Fadlon and Nielsen about Danish data

> Applications can be submitted by researchers who are affiliated with Danish institutions accepted by Statistics Denmark, or by researchers outside of Denmark who collaborate with researchers affiliated with these institutions.

(Example taken from [Fadlon and Nielsen, AEJ:Applied 2021](https://doi.org/10.1257/app.20170604)).


## Examples {.smaller transition="fade" }

Also grant permission to your project files:

> I grant any researchers with appropriate Census-approved project permission to use my exact research files provided that those files were among the ones that they requested when the approval was obtained (a Census Bureau requirement). These files can be found by searching for the DOI of
[this archive/ this article] amongst backups/archives made in [month of archive].

## Don't forget to cite the data {.smaller}

> Bureau of the Census. (release year). American Community Survey-Master Address File Crosswalk YYYY-YYZZ [Data File]. Federal Statistical Research Data Center [distributor].
>
> Graf, Tobias; Grießemer, Stephan; Köhler, Markus; Lehnert, Claudia; Moczall, Andreas; Oertel, Martina; Schmucker, Alexandra; Schneider, Andreas; Seth, Stefan; Thomsen, Ulrich; vom Berge, Philipp (2023): "Weakly anonymous Version of the Sample of Integrated Labour Market Biographies (SIAB) – Version 7521 v1". Research Data Centre of the Federal Employment Agency (BA) at the Institute for Employment Research (IAB). <https:/doi.org/10.5164/IAB.SIAB7521.de.en.v1>


- Further examples on [Zotero for FSRDC](https://www.zotero.org/groups/2245704/fsrdc) (possibly not the most current).
- Ideally, every research data center would have  "landing pages" for the data (the IAB example does)
````

- [ ] **Step 2: Commit**

```bash
git add presentation/provenance-private.md
git commit -m "Split readme-fsrdc: private-data provenance slides"
```

---

### Task 2: Split — create `computational-requirements.md`

Lifts the computer-requirements slides out of `02-readme-fsrdc.md`.

**Files:**
- Create: `presentation/computational-requirements.md`

- [ ] **Step 1: Create the file with this exact content**

````markdown
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
````

- [ ] **Step 2: Commit**

```bash
git add presentation/computational-requirements.md
git commit -m "Split readme-fsrdc: computational requirements slides"
```

---

### Task 3: Split + merge — create `readme-notebook.md`

Reframes the README "three parts / day-1 / timing" content (from `02-readme-fsrdc.md`) plus the deep-dive link (from `05-readme.md`) as "README as a lab notebook". Detailed availability and computer-requirements content now lives in Tasks 1 and 2, so this file keeps only framing + processing + timing + link.

**Files:**
- Create: `presentation/readme-notebook.md`

- [ ] **Step 1: Create the file with this exact content**

````markdown
# The README as a lab notebook

Your README is not paperwork you write at the end — it is the **memory of the project**, kept as you go.

## Three parts to the README

- Data availability (and citations)
- Computer requirements
- Description of processing

## Start with the last part

That's easy: you've been keeping clean instructions since the start, right?

- Run "`main.do`" or `run.sh`
- Describe what parts might be skipped
- Describe what the various parts do
- Describe which parts use confidential data

You've been doing that **since day 1!**

## Three parts to README: timing

| | |
|---------|----------|
|- Data availability (and citations):|**Start of project, edit at the end**|
|- Computer requirements: | Middle of project|
|- Description of processing: | Middle of project|
| | |

with the end really just a last read/edit.

## Let's go deeper

[README presentation](https://larsvilhuber.github.io/readme-presentation/)
````

- [ ] **Step 2: Commit**

```bash
git add presentation/readme-notebook.md
git commit -m "Split readme-fsrdc + merge 05-readme: README as lab notebook"
```

---

### Task 4: Author — `private-goal.md`

**Files:**
- Create: `presentation/private-goal.md`

- [ ] **Step 1: Create the file with this exact content**

````markdown
# Why bother? The private payoff

**The public goal is the replication package. The private goal is _you_.**

## Efficiency, not just compliance

Good habits from day 1 pay off long before the journal asks:

- Fewer, shorter trips to the RDC
- Re-runs that "just work" instead of archaeology
- Less time lost when an RA leaves

## Fewer / shorter RDC trips

- A clean `run.sh` top-to-bottom means you re-run, not re-discover
- Disclosure requests go faster when code and outputs are already organized
- You spend scarce enclave time on research, not on remembering

## Surviving RA turnover

- The student who wrote `merge_v3_final_FINAL.do` graduated
- Documented, organized code is the only thing that transfers
- Your future self is also a new RA with no memory of today

## The bargain

A little discipline now buys:

- **speed** (less travel, faster disclosure)
- **resilience** (people come and go)
- a replication package that is almost free at the end
````

- [ ] **Step 2: Commit**

```bash
git add presentation/private-goal.md
git commit -m "Author private-goal slides (efficiency payoff)"
```

---

### Task 5: Author — `file-organization.md`

**Files:**
- Create: `presentation/file-organization.md`

- [ ] **Step 1: Create the file with this exact content**

````markdown
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
  public/         # shippable
run.sh
```

## Why structure first?

- Separating `confidential/` from `public/` makes disclosure obvious
- Separating `code/fsrdc/` from `code/public/` shows what runs where
- A single `run.sh` documents the order of operations

## One rule

> If you can tell, from the path alone, whether a file can be released, you have organized well.
````

- [ ] **Step 2: Commit**

```bash
git add presentation/file-organization.md
git commit -m "Author file-organization slides"
```

---

### Task 6: Author — `versioning.md`

**Files:**
- Create: `presentation/versioning.md`

- [ ] **Step 1: Create the file with this exact content**

````markdown
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
````

- [ ] **Step 2: Commit**

```bash
git add presentation/versioning.md
git commit -m "Author versioning slides"
```

---

### Task 7: Author — `code-raw-to-output.md`

**Files:**
- Create: `presentation/code-raw-to-output.md`

- [ ] **Step 1: Create the file with this exact content**

````markdown
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
````

- [ ] **Step 2: Commit**

```bash
git add presentation/code-raw-to-output.md
git commit -m "Author code-raw-to-output slides"
```

---

### Task 8: Author — `plan-for-it.md`

**Files:**
- Create: `presentation/plan-for-it.md`

- [ ] **Step 1: Create the file with this exact content**

````markdown
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
````

- [ ] **Step 2: Commit**

```bash
git add presentation/plan-for-it.md
git commit -m "Author disclosure plan-for-it slides"
```

---

### Task 9: Author — `packages.md`

Replaces the detailed `12-environments-in-stata.md` in the main flow with a reference (that file stays in the Appendix).

**Files:**
- Create: `presentation/packages.md`

- [ ] **Step 1: Create the file with this exact content**

````markdown
# Packages, and where you got them

## Record your dependencies

- Which packages? Which **versions**? (`which estout`, `sessionInfo()`)
- Where did you get them — CRAN, PyPI, SSC, a GitHub repo?
- Pin versions where the language allows it

## Make the environment portable

Project-local package environments keep one project from breaking another, and travel with your code.

- See the full walkthrough (incl. Stata):
  [Creating environments](https://larsvilhuber.github.io/self-checking-reproducibility/10-creating-environments.html)
````

- [ ] **Step 2: Commit**

```bash
git add presentation/packages.md
git commit -m "Author packages slide (reference to environments page)"
```

---

### Task 10: Author — `confidential-data-packaging.md`

**Files:**
- Create: `presentation/confidential-data-packaging.md`

- [ ] **Step 1: Create the file with this exact content**

````markdown
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
````

- [ ] **Step 2: Commit**

```bash
git add presentation/confidential-data-packaging.md
git commit -m "Author confidential-data packaging slides"
```

---

### Task 11: Rewrite `index.qmd` include order + section dividers, delete split sources

**Files:**
- Modify: `presentation/index.qmd` (replace the body from the `01-goal.md` include through end of file)
- Delete: `presentation/02-readme-fsrdc.md`, `presentation/05-readme.md`

- [ ] **Step 1: Replace the tail of `index.qmd`**

Find this exact block (everything from the first content include to end of file):

````markdown
```{r, child=c(here::here('01-goal.md'))}
```

```{r, child=c(here::here('02-what-is-confidential-data.md'))}
```


```{r, child=c(here::here('interactive-exercise-1.md'))}
```

```{r, child=c(here::here('04-provenance.md'))}
```

```{r, child=c(here::here('interactive-exercise-2.md'))}
```



```{r, child=c(here::here('05-readme.md'))}
```



```{r, child=c(here::here('06-secrets-in-code.md'))}
```


```{r, child=c(here::here('16-survey-extract.md'))}
```




```{r, child=c(here::here('07-wrapping-up.md'))} 
```

# Appendix


```{r, child=c(here::here('12-environments-in-stata.md'))} 
```

```{r, child=c(here::here('99-links.md'))}
```
````

Replace it with:

````markdown
# What is the goal

```{r, child=c(here::here('02-what-is-confidential-data.md'))}
```

```{r, child=c(here::here('01-goal.md'))}
```

```{r, child=c(here::here('private-goal.md'))}
```

# How to get there

```{r, child=c(here::here('file-organization.md'))}
```

```{r, child=c(here::here('versioning.md'))}
```

```{r, child=c(here::here('readme-notebook.md'))}
```

# What is required

```{r, child=c(here::here('code-raw-to-output.md'))}
```

```{r, child=c(here::here('04-provenance.md'))}
```

```{r, child=c(here::here('16-survey-extract.md'))}
```

```{r, child=c(here::here('provenance-private.md'))}
```

# Disclosure avoidance

```{r, child=c(here::here('plan-for-it.md'))}
```

```{r, child=c(here::here('06-secrets-in-code.md'))}
```

```{r, child=c(here::here('packages.md'))}
```

```{r, child=c(here::here('computational-requirements.md'))}
```

```{r, child=c(here::here('confidential-data-packaging.md'))}
```

```{r, child=c(here::here('07-wrapping-up.md'))} 
```

# Appendix

```{r, child=c(here::here('interactive-exercise-1.md'))}
```

```{r, child=c(here::here('interactive-exercise-2.md'))}
```

```{r, child=c(here::here('12-environments-in-stata.md'))} 
```

```{r, child=c(here::here('99-links.md'))}
```
````

> Note: the literal `# Goal` agenda slide (the three `- [ ]` objective checkboxes, currently just above the `01-goal.md` include) stays as-is — it is the talk agenda and precedes the new `# What is the goal` section.

- [ ] **Step 2: Delete the now-redistributed source files**

```bash
git rm presentation/02-readme-fsrdc.md presentation/05-readme.md
```

- [ ] **Step 3: Verify every include resolves and no dead references remain**

```bash
cd presentation && \
  for f in $(grep -oP "here::here\('\K[^']+" index.qmd); do test -f "$f" || echo "MISSING: $f"; done; \
  echo "--- dead refs ---"; \
  grep -n "02-readme-fsrdc\|05-readme" index.qmd || echo "none"; \
  cd ..
```

Expected: no `MISSING:` lines; under "--- dead refs ---" it prints `none`.

- [ ] **Step 4: Commit**

```bash
git add presentation/index.qmd
git commit -m "Reorganize deck into four-section flow; drop split source files"
```

---

### Task 12: Best-effort render check

Confirms the deck still builds. Quarto may not be installed or may warn about the empty `GITHUB_REPOSITORY` env var — that is acceptable; a missing-include or fatal error is not.

**Files:** none (verification only)

- [ ] **Step 1: Attempt a render**

```bash
cd presentation && quarto render index.qmd 1>/tmp/quarto-render.log 2>&1; echo "exit=$?"; tail -20 /tmp/quarto-render.log; cd ..
```

Expected: `exit=0`. If `quarto` is not found, record that the render was skipped (the Task 11 include check is the binding verification). If the render fails on a missing child file, fix the offending include and re-run.

- [ ] **Step 2: Sanity-check the resulting structure (only if render produced HTML)**

```bash
grep -c "What is the goal\|How to get there\|What is required\|Disclosure avoidance" presentation/index.html
```

Expected: a count of at least 4 (the four section titles are present).

---

## Self-Review

**Spec coverage:**
- What is the goal → public: `01-goal.md`; private: `private-goal.md` (Task 4); framing: `02-what-is-confidential-data.md` (opener). ✓
- How to get there → file organization `file-organization.md` (5); versioning `versioning.md` (6); README as lab notebook `readme-notebook.md` (3). ✓
- What is required → code raw→output `code-raw-to-output.md` (7); public data + provenance `04-provenance.md` + `16-survey-extract.md`; private-data provenance `provenance-private.md` (1). ✓
- Disclosure avoidance → plan `plan-for-it.md` (8); safe programming `06-secrets-in-code.md`; packages `packages.md` (9); computational requirements `computational-requirements.md` (2); confidential-data zip A/B `confidential-data-packaging.md` (10). ✓
- Exercises + environments deep-dive in Appendix; main flow references external environments page. ✓ (Task 11 + Task 9)
- `02-readme-fsrdc.md` fully redistributed (Tasks 1–3) and deleted (Task 11). `05-readme.md` merged into Task 3 and deleted. ✓
- Naming: no existing file renamed; new files use slugs. ✓
- Render check (success criterion "renders without missing-include errors"). ✓ (Task 12)

**Placeholder scan:** No TBD/TODO; every create step carries full file content; verification steps carry exact commands and expected output. ✓

**Type/name consistency:** Every slug referenced in the Task 11 `index.qmd` block is created by an earlier task (`private-goal`, `file-organization`, `versioning`, `readme-notebook`, `code-raw-to-output`, `provenance-private`, `plan-for-it`, `packages`, `computational-requirements`, `confidential-data-packaging`) or pre-exists (`02-what-is-confidential-data`, `01-goal`, `04-provenance`, `16-survey-extract`, `06-secrets-in-code`, `07-wrapping-up`, `interactive-exercise-1`, `interactive-exercise-2`, `12-environments-in-stata`, `99-links`). ✓
