import flask
import requests
import config

app = flask.Flask(__name__)

API_URL = "https://ws.audioscrobbler.com/2.0/"

@app.route("/proxy", methods={ "GET", "POST" })
def proxy():
    params = (
        dict(flask.request.form)
        if len(flask.request.form) > 0 else
        dict(flask.request.args)
    )

    response = requests.request(
        method=flask.request.method,
        url=API_URL,
        params=params
    )

    return flask.Response(
        response=response.content,
        status=response.status_code
    )
