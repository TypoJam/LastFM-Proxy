#! /usr/bin/env bash

flask --app app/index.py run --debug --host=0.0.0.0 --cert cert/dev.cert --key cert/dev.key
