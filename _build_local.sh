#!/bin/bash
PWD=$(pwd)
repo=reproducibility-confidential
dockerspace=larsvilhuber

case $USER in
  vilhuber)
  #WORKSPACE=$HOME/Workspace/git
  WORKSPACE=$PWD
  ;;
  codespace)
  WORKSPACE=/workspaces
  ;;
esac
  
# build the docker if necessary

docker pull $dockerspace/$repo 
BUILD=no

docker run -e PASSWORD=testing -v $WORKSPACE:/home/rstudio --rm $dockerspace/$repo /home/rstudio/_build.sh
