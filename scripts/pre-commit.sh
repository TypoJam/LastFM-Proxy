#! /usr/bin/env bash

set -eo pipefail

source scripts/venv.sh
# TODO: I want this to be `mypy .` but there's some shenanigans about relative
#       imports which I can't be bothered to fix at the moment
mypy passenger_wsgi.py
