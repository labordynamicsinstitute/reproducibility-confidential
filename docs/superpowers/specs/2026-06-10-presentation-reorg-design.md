# Presentation reorganization — design

**Date:** 2026-06-10
**Topic:** Reorganize the `presentation/` reveal.js deck ("Reproducibility when data are confidential") into a new four-section flow.

## Goal

Re-sequence and regroup the existing slide deck into the following narrative, authoring new content where the flow requires topics that do not yet have slides:

1. **What is the goal**
   - public: replication package
   - private: efficiency (travel, RA changes)
2. **How to get there**
   - file organization
   - versioning if possible
   - README as a lab notebook / memory
3. **What is required**
   - Code from raw data to output
   - All public data and their provenance
   - Provenance of any private data (RDC, other)
4. **Disclosure avoidance**
   - Plan for it
   - Safe programming tool examples / Software
   - Packages and where you got them
   - Computational requirements
   - What to do with the confidential data: A. zip, B. zip external data

## Decisions (from brainstorming)

- **Gaps → fully authored.** New topics (private/efficiency goal, file organization, versioning, disclosure "plan for it", code raw→output, packages reference, confidential-data packaging) are written out as complete slides in the existing style, not stubs.
- **File structure → Approach A.** Keep the existing convention of many small single-purpose `.md` files included by `index.qmd`, renumbered to the new order, with four `#` section-divider headings.
- **Interactive exercises → Appendix.** Both `interactive-exercise-1.md` and `interactive-exercise-2.md` move to the Appendix.
- **Packages → external reference.** Replace the detailed `12-environments-in-stata.md` content in the main flow with a short slide referencing
  <https://larsvilhuber.github.io/self-checking-reproducibility/10-creating-environments.html>. The full `12-environments-in-stata.md` is retained in the Appendix as an optional deep-dive.
- **`what-is-confidential-data` placement → opener of "What is the goal."**

## Architecture

The deck is a Quarto/reveal.js presentation. `presentation/index.qmd` includes child `.md` files in order via `{r, child=c(here::here('FILE.md'))}` blocks. Reveal renders `#` as section-title slides and `##` as content slides. Reorganization = (a) editing the include order in `index.qmd`, (b) splitting/renaming/creating child `.md` files, (c) adding four `#` section dividers.

### Key refactor: split `02-readme-fsrdc.md`

That file currently bundles three concerns that the new flow distributes:

- README "three parts" + "you've been doing this since day 1" + timing table → **README as lab notebook** (section 2).
- Computer-requirements slides (memory, runtime, nodes, software versions, PBS/`qsub`) → **Computational requirements** (section 4).
- Data-availability example blocks (FSRDC/Fort, Danish/Fadlon-Nielsen, project-file permission, data citation, Zotero) → **Provenance of private data** (section 3).

It is split into three files accordingly. `05-readme.md` (short "three parts" + deep-dive link) is merged into the README-as-lab-notebook file.

## Target slide map

Intro (unchanged): `00-qrcode.md` → `00-follow-along.md`

**`# What is the goal`**
- `02-what-is-confidential-data.md` — framing (existing, moved up)
- `01-goal.md` — public goal: the final replication package, file-tree build-up (existing)
- `private-goal.md` — **NEW** private goal: efficiency, fewer/shorter RDC trips, surviving RA turnover, future self

**`# How to get there`**
- `file-organization.md` — **NEW** predictable layout (reuses the package tree as target)
- `versioning.md` — **NEW** version files "if possible" (git; coping inside an RDC where git may be absent)
- `readme-notebook.md` — **NEW (composed)** README as lab notebook/memory; from `05-readme.md` + README/timing parts of `02-readme-fsrdc.md`; links to README deep-dive

**`# What is required`**
- `code-raw-to-output.md` — **NEW** code runs raw data → output, top to bottom
- `provenance-public.md` — public data + provenance; from `04-provenance.md` (licenses, recording, CEPII example)
- `survey-extract.md` — processing data from source; from `16-survey-extract.md`
- `provenance-private.md` — **NEW (from split)** provenance of private data: RDC/Danish/citation example blocks

**`# Disclosure avoidance`**
- `plan-for-it.md` — **NEW** plan for disclosure from day 1
- `secrets-in-code.md` — safe programming: secrets, confidential code, avoiding confidential data in code; from `06-secrets-in-code.md`
- `packages.md` — **NEW** packages & where you got them → reference to the self-checking-reproducibility environments page
- `computational-requirements.md` — **NEW (from split)** memory, runtime, nodes, PBS/`qsub`, software versions
- `confidential-data-packaging.md` — **NEW** what to do with the confidential data: A. zip the package, B. zip external data

**Wrap-up:** `07-wrapping-up.md` (existing)

**`# Appendix`**
- `interactive-exercise-1.md`, `interactive-exercise-2.md` (moved)
- `12-environments-in-stata.md` (kept as optional deep-dive)
- `99-links.md` (existing)

## Naming convention

New/renamed files use descriptive slugs (not numeric prefixes) since order is controlled by `index.qmd` include order, matching the recent additions (`interactive-exercise-1.md`, etc.). Existing numbered files are left at their current names unless split.

> Open question to confirm during implementation: whether to renumber existing files (e.g. `01-goal.md`) for consistency, or leave numeric names as-is and rely on `index.qmd` order. Default: leave names as-is to minimize churn; order comes from `index.qmd`.

## Content style for authored slides

- Match existing voice: short imperative bullets, occasional bold for emphasis, fenced code blocks for Stata/R, `{.smaller}` / `{transition="fade"}` attributes where appropriate.
- Reuse the existing package file-tree (from `01-goal.md`) as the concrete artifact referenced by file-organization and confidential-data-packaging slides.
- Draw factual content from the companion book chapters in the repo where relevant (e.g. confidential-code chapter) rather than inventing.

## Out of scope

- No changes to book chapters or non-presentation content.
- No build-system / CI changes (`_build.sh`, `compile-all.yml`) beyond what the include reorg requires.
- No restyling (`style.css`) beyond reuse of existing classes.

## Success criteria

- `index.qmd` include order reflects the four-section flow with `#` dividers.
- Every new-flow line item has a corresponding slide (authored or moved).
- `02-readme-fsrdc.md` content is fully redistributed (no orphaned/duplicated content).
- Both exercises and the environments deep-dive live in the Appendix; main flow references the external environments page.
- Deck renders (Quarto build) without missing-include errors.
