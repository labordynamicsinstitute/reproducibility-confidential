(environments-in-stata)=
# Environments in Stata

## TL;DR

- Creating virtual environments in Stata is feasible
- Doing so stabilizes the code, and makes it more transportable

## Search paths in Stata

In Stata, we typically do not talk about environments, but the same basic structure applies: Stata searches along a set order for its commands. Some commands are built into the executable (the software that is opened when you click on the Stata icon), but most other internal, and all external commands, are found in a search path. This is typically the `ado` directory in the Stata installation directory, and one will find replication packages that contain instructions to copy files into that directory. Once we've shown how environments work in Stata, this will become a lot simpler!

### The `sysdir` directories

The default set of directories which can be searched, from a freshly installed Stata, can be queried with the `sysdir` command, and will look something like this:

```stata
sysdir
```

```
   STATA:  C:\Program Files\Stata18\
    BASE:  C:\Program Files\Stata18\ado\base\
    SITE:  C:\Program Files\Stata18\ado\site\
    PLUS:  C:\Users\lv39\ado\plus\
PERSONAL:  C:\Users\lv39\ado\personal\
OLDPLACE:  c:\ado\
```

### The `adopath` search order

The search paths where Stata looks for commands is queried by `adopath`, and looks similar, but now has an order assigned to each entry:

```stata
adopath
```

```
  [1]  (BASE)      "C:\Program Files\Stata18\ado\base/"
  [2]  (SITE)      "C:\Program Files\Stata18\ado\site/"
  [3]              "."
  [4]  (PERSONAL)  "C:\Users\lv39\ado\personal/"
  [5]  (PLUS)      "C:\Users\lv39\ado\plus/"
  [6]  (OLDPLACE)  "c:\ado/"
```

To look for a command, say `reghdfe`, Stata will look in the first directory, then the second, and so on, until it finds it. If it does not find it, it will return an error. We can query the location of `reghdfe` explicitly with `which`:

```stata
which reghdfe
```

```
command reghdfe not found as either built-in or ado-file
r(111);
```

### Where are packages installed?

[^1]: [`net install` refererence](https://www.stata.com/manuals/rnet.pdf). Strictly speaking, the location where ado packages are installed can be changed via the `net set ado` command, but this is rarely done in practice, and we won't do it here. 


When we install a package, using one of the various package installation commands (`net install`, `ssc install`)[^1], only one of the (`sysdir`) paths is relevant: `PLUS`. So if we install `reghdfe` with `ssc install reghdfe`, it will be installed in the `PLUS` directory, and we can see that with `which`:

```stata
ssc install reghdfe
which reghdfe
```

```
. ssc install reghdfe
checking reghdfe consistency and verifying not already installed...
installing into C:\Users\lv39\ado\plus\...
installation complete.

. which reghdfe
C:\Users\lv39\ado\plus\r\reghdfe.ado
*! version 6.12.3 08aug2023
```

:::{important}
It is important here to recognize that it is the value of the special `sysdir` directory `PLUS` that determines where Stata installs commands, but the separate list of `adopath`  locations where it looks for commands. It is possible to install a command in a location that Stata does not look for commands!
:::

## Using environments in Stata

But the `(PLUS)` directory can be manipulated, and that creates the opportunity to create an "environment". 



```stata

* Set the root directory

global rootdir : pwd

* Define a location where we will hold all packages in THIS project (the "environment")

global adodir "$rootdir/ado"

* make sure it exists, if not create it.

cap mkdir "$adodir"

* Now let's simplify the adopath
* - remove the OLDPLACE and PERSONAL paths
* - NEVER REMOVE THE SYSTEM-WIDE PATHS - bad things will happen!

adopath - OLDPLACE
adopath - PERSONAL

* modify the PLUS path to point to our new location, and move it up in the order

sysdir set PLUS "$adodir"
adopath ++ PLUS

* verify the path

adopath
```

which should show something like this:

```
. adopath
  [1]  (PLUS)      "C:\Users\lv39\Documents/PROJECT123/ado/"
  [2]  (BASE)      "C:\Program Files\Stata18\ado\base/"
  [3]  (SITE)      "C:\Program Files\Stata18\ado\site/"
  [4]              "."
```

Let's verify again where the `reghdfe` package is:

```stata
which reghdfe
```

```
. which reghdfe
command reghdfe not found as either built-in or ado-file
r(111);
```

So it is no longer found. Why? Because we have removed the previous location (the old `PLUS` path) from the search sequence. It's as if it didn't exist.



## Installing packages when an environment is active


When we now install `reghdfe` again:

```
. ssc install reghdfe
checking reghdfe consistency and verifying not already installed...
installing into C:\Users\lv39\Documents\PROJECT123\ado\plus\...
installation complete.

. which reghdfe
C:\Users\lv39\Documents\PROJECT123\ado\plus\r\reghdfe.ado
*! version 6.12.3 08aug2023
```

We now see it in the **project-specific** directory, which we can distribute with the whole project (more on that [later](reproducing-environments)). 

## Installing precise versions of packages
Let's imagine we need an older version of `reghdfe`. In general, it is **not** possible in Stata to install an older version of a package in a straightforward fashion. You *may* have success with the [Wayback Machine archive of SSC](https://web.archive.org/web/20141226200440/http://fmwww.bc.edu/RePEc/bocode/), which in some cases goes back to 2000, by carefully reconstructing the necessary files. 

Most package repositories are versioned:

- R: CRAN, Bioconductor
- Python: PyPI
- Julia: “General” default Julia package registry.

State does not (as of 2024). But see the [full site](https://larsvilhuber.github.io/self-checking-reproducibility/12-environments-in-stata.html#installing-precise-versions-of-packages) for one approach.

# Takeaways

From the earlier desiderata of *environments*:

- [x] **Isolated**: Installing a new or updated package for one project won’t break your other projects, and vice versa.
- [x] **Portable**: Easily transport your projects from one computer to another, even across different platforms.
- [ ] **Reproducible**: Records the exact package versions you depend on, and ensures those exact versions are the ones that get installed wherever you go.
