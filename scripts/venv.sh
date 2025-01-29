#! /usr/bin/env bash

VENV_DIR=".venv"
PYTHON="/usr/bin/env python3"
REQUIREMENTS="requirements.txt"
CONFIG_FILE="app/config.py"

function activate {
    source $VENV_DIR/bin/activate
}

if [[ ! -f "$CONFIG_FILE" ]] then
    # Create example config file
    # NOTE: Empty for now
    true # Fix empty then block
fi

if [[ ! -d "$VENV_DIR" ]] then
    # Create virtual environment and install required packages
    $PYTHON -m venv "$VENV_DIR"
    activate
    pip install -r "$REQUIREMENTS"
else
    activate
fi
