from . import config
import flask
import hashlib
import requests

app = flask.Flask(__name__)
application = app

API_URL = "https://ws.audioscrobbler.com/2.0/"

# https://www.last.fm/api/mobileauth#_4-sign-your-calls
def sign_request(params: dict[str, str], api_secret: str) -> str:
    keys = list(params.keys())
    keys.sort()

    to_hash = ""

    for key in keys:
        if key in ("format", "api_sig"):
            continue

        to_hash += key
        to_hash += params[key]

    to_hash += api_secret

    return hashlib.md5(to_hash.encode("utf-8")).hexdigest()

@app.route("/proxy", methods={ "GET", "POST" })
def proxy():
    params = (
        dict(flask.request.form)
        if len(flask.request.form) > 0 else
        dict(flask.request.args)
    )

    if "api_key" in params:
        params["api_key"] = config.LASTFM_API_KEY

    if "api_sig" in params:
        params["api_sig"] = sign_request(params, config.LASTFM_API_SECRET)

    response = requests.request(
        method=flask.request.method,
        url=API_URL,
        params=params
    )

    return flask.Response(
        response=response.content,
        status=response.status_code
    )
