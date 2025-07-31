#!/bin/bash

PYTHON_ENV=book-env
PYTHON_VERSION=3.11
# Check if the environment already exists
if [ -d "$PYTHON_ENV" ]; then
    echo "Python environment '$PYTHON_ENV' already exists."
else
    echo "Creating Python environment '$PYTHON_ENV'."
    python${PYTHON_VERSION} -m venv $PYTHON_ENV
fi
# Activate the environment
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    # untested
    source "$PYTHON_ENV/Scripts/activate"
else
    source "$PYTHON_ENV/bin/activate" || exit 2
fi

# Install Python requirements

pip install -r requirements.txt

# Build the website: 

jupyter-book build .