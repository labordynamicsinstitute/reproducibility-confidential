#!/bin/bash

PYTHON_ENV=book-env
# Check if the environment already exists
if [ -d "$PYTHON_ENV" ]; then
    echo "Python environment '$PYTHON_ENV' already exists."
else
    echo "Creating Python environment '$PYTHON_ENV'."
    python -m venv $PYTHON_ENV
fi
# Activate the environment
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
    # untested
    source "$PYTHON_ENV/Scripts/activate"
else
    source "$PYTHON_ENV/bin/activate"
fi

# Install Python requirements

pip install -r requirements.txt

# Build the website: 

jupyter-book build .