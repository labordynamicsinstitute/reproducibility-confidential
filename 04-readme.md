(the-readme)=
# The README as a lab notebook

Your README is not paperwork you write at the end — it is the **memory of the project**, kept as you go.

## Helpful template

Full description as per the [(template) README](https://social-science-data-editors.github.io/template_README/)

[![README](images/img-2021-11-08-2.png)](https://social-science-data-editors.github.io/template_README/)

## Three parts to the README

- Data availability, provenance, and citations
- Computer requirements
- Description of processing

Deep dive: [README presentation](https://larsvilhuber.github.io/readme-presentation/)

## Data provenance

In the RDC, you know where your **confidential** data comes from! Other data must still be described - you may have done that already to bring it in. See [](provenance-private) for how to describe data availability, and [](provenance) for licenses and recording information.

## Computer requirements

You might say

> "But I did not choose my computer environment! They forced me!"

You still need to describe it.

- You might need to know in a *future* project
- There may be **costs** associated with your specific environment
- Others want to *replicate* your work in a different environment

In most confidential environments, such as FSRDC/IRE, this part is out of your control. But you should describe it anyway! You should include the approximate description of computer/nodes used. This includes memory size (though we are interested in actual usage, not the maximum of what the system has), and compute time (how long does a clean run, from top to bottom, take?), and number of nodes (any parallel processing?). You should also detail the software used, that is, the version of software (Stata 17, update level), and all packages, ideally version of package (which `estout`).

### FSRDC

Did you use PBS? Sure you did. Include the `qsub` files. Or if you used `qstata` or such, describe that: 

```text
...
run.sh
qsub-complete.sh
```

## Description of processing

That's easy: you've been keeping clean instructions since the start, right?

- Run `main.do` or `run.sh`
- Describe what parts might be skipped
- Describe what the various parts do
- Describe which parts use confidential data

You've been doing that **since day 1!**

## Three parts to README: timing

- Data availability (and citations) -- start of the project, edit at the end
- Computer requirement -- middle of the project 
- Description of processing -- middle of the project

With the end really just a last read/edit.
