# TypoJam LastFM Proxy server

Server that proxies last.fm requests coming from TypoJam so our API key/secret doesn't get exposed.

# Quick Start

```sh
$ . scripts/venv.sh
$ micro app/config.py # Set up config
$ ./scripts/run-dev.sh
```

# Contributing

Contributing is always appreciated! Feel free to create a pull request.

Before you do, make sure you checked your code with `mypy` (Included in `requirements.txt`).
If you're on Linux (or any other environment that has bash) you can create a symlink so it checks your code before you commit:
```sh
$ ln -s $PWD/scripts/pre-commit.sh .git/hooks/pre-commit
```
