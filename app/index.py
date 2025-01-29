import flask
import requests
import config

app = flask.Flask(__name__)

API_URL = "https://ws.audioscrobbler.com/2.0/"

@app.route("/proxy")
def proxy():
    response = requests.request(
        method=flask.request.method,
        url=API_URL,
        params=dict(flask.request.args)
    )

    return flask.Response(
        response=response.content,
        status=response.status_code
    )
