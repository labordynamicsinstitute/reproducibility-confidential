#!/bin/bash

. ./.myconfig.sh

case $USER in
  codespace)
  WORKSPACE=/workspaces
  ;;
  *)
  WORKSPACE=$PWD
  ;;
esac

# map cache if present

if [[ -d $WORKSPACE/.cache ]]
then
  echo "Found cache"
  # Ensure cache directory is writable
  chmod a+rwX $WORKSPACE/.cache
  DOCKEREXTRA="$DOCKEREXTRA -v $WORKSPACE/.cache:/home/rstudio/.cache"
fi

docker run --rm $DOCKEREXTRA -e DISABLE_AUTH=true \
   -e RENV_PATHS_CACHE=/home/rstudio/.cache \
   -v "$WORKSPACE":/home/rstudio -w /home/rstudio/ $dockerrepo:$tag quarto render index.qmd
