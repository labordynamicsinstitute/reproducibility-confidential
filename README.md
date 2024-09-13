# Reproducible Research from Day 1 

(derived from https://github.com/codedthinking/day1)

Instructors: Miklós Koren and Lars Vilhuber, data editors of the Review of Economic Studies and the American Economic Association

Summary: Journals require that you share your code and data in a replication package at the end of your research project. Following some best practices from day 1 can not only help you prepare this package later, but also make you a more productive researchers. In this workshop, we start with an empty folder, and finish with a mini-project about public procurement across various European countries. Together we discuss and document all the choices we make about data collection and analysis, in a way that can help future readers of our research.

# Outline

1. Tools needed: 
  - Stata (see [Tools.md](Tools.md) if you do not have a Stata license). It is feasible to do the whole exercise in R as well, but examples will be in Stata.
  - text editor (we suggest [VS Code](https://code.visualstudio.com/), but any will do)
  - browser
  - file browser (e.g., Windows Explorer, Finder, Nautilus, etc.)
2. Setup
	1. Create an empty folder, like `Documents/day1`
	2. Navigate to this folder in Stata
	3. Open this folder in your text editor, if it can open folders
	4. Google "CEPII GeoDist"
3. Explain need for automation and data documentation 
	1. No point and click download
	2. No download before checking and documenting we have the right to do so
	3. Code: (Stata) `copy "$URL" (outputfile), replace` (R) `download.file(url="$URL",destfile="(outputfile)")`
4. STOP - how do we keep track of that?
4. Create `README.md` before doing anything
5. Add DAS and data citation
	1. Cite both dataset and working paper
	2. Add data URL and time accessed (can you think of a way to automate this?)
	3. Add a link to license (also: download and store the license)
6. Create separate folders for each function: `code/` and `data/`
7. Create a script `01_download_data.do`
8. Run script with relative path only, check data has been downloaded
   1. Where should the downloaded data go? (`data/raw, data/external`?)
9. Repeat same steps for *Tenders Electronic Data*, using sample distributed by us
	1. license, citations etc are already introduced so it is easier to deal with the extra complication of a data extract
	2. [ ] Do we publish this extract to be cited as distributors? I have a GitHub release, but no DOI.
10. Write a data filtering script for TED.
    1. What do we filter on? Provide instructions.
11. Write a merging script. These two can go in the same script, `02_create_sample.do`
	1. [ ] Are country codes compatible?
	2. Where does the newly merged data go? (`data/interim`?)
12. Write `03_define_variables.do`
13. Write `04_analysis.do`. Save result (figure?) in a separate folder (`results/figures`?)
	1. [ ] Figure of log procurement amount against log distance
	2. Style figure using `plotplain` (Stata) or `theme_minimal()` (R)
	   - What do you need in Stata to do that?
	3. Automate saving the figure: (Stata) `graph export "results/figures/figure1.png", replace` (R) `ggsave("results/figures/figure1.png")`
14. Write a main script, `main.do`.
15. Document these steps in `README.md`
16. ZIP and ready

## Stretch goals

17. In both Stata and R versions, we used external packages. How to document them? Where to install them?
18. Publish the ZIP file on a repository (e.g., [Zenodo Sandbox](https://sandbox.zenodo.org/)) or via a share (e.g., [Dropbox](https://www.dropbox.com/), [OSF](https://osf.io/), etc.)
19. Exchange information with somebody in the room.
20. Download their ZIP file, and try to reproduce their results.
    1. Can you do so by changing only 1 line of code?
	2. Can you do so without changing a single line of code?
