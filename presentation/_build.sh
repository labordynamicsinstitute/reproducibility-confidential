#!/bin/sh

set -ev


cd $(dirname $0)

# build the handbook
# Rscript _build.R
quarto render    index.qmd --profile english  --output-dir _html/
quarto render es/index.qmd --profile espagnol --output-dir _html/

