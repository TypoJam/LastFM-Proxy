#! /usr/bin/env fish

set VENV_DIR ".venv"
set PYTHON /usr/bin/env python3
set REQUIREMENTS "requirements.txt"
set CONFIG_FILE "app/config.py"

function activate
    source $VENV_DIR/bin/activate.fish
end

if ! test -e "$CONFIG_FILE"
    # Create example config file
    echo "LASTFM_API_KEY = \"abcef0123456789\"" >> $CONFIG_FILE
    echo "LASTFM_API_SECRET = \"abcef0123456789\"" >> $CONFIG_FILE
end

if ! test -d "$VENV_DIR"
    # Create virtual environment and install required packages
    $PYTHON -m venv "$VENV_DIR"
    activate
    pip install --upgrade pip
    pip install -r "$REQUIREMENTS"
else
    activate
end
