#!/bin/sh

set -ev


cd $(dirname $0)

# build the handbook
# Rscript _build.R
quarto render  index.Rmd --output-dir _html

