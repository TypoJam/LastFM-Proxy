# TypoJam LastFM Proxy server

Server that proxies last.fm requests coming from TypoJam so our API key/secret don't get exposed.

# Quick Start
```sh
$ . scripts/venv.sh
$ micro app/config.py # Set up config
$ flask --app app/index.py run --debug
```
