"""
A sample Hello World server.
"""
import os
import rook

from flask import Flask, render_template

rook.start(token='1a43c7f087d9c43341653af043d498bc800f22a5bc6a70b1e0c0fe232b8b3b3e', labels={"env":"dev"})

# pylint: disable=C0103
app = Flask(__name__)

region = "eu" # This is used to showcase Rookout

@app.route('/')
def hello():
    """Return a friendly HTTP greeting."""
    message = "It's running!"

    """Get Cloud Run environment variables."""
    service = os.environ.get('K_SERVICE', 'Unknown service')
    revision = os.environ.get('K_REVISION', 'Unknown revision')

    return render_template('index.html',
        message=message,
        Service=service,
        Revision=revision)

if __name__ == '__main__':
    server_port = os.environ.get('PORT', '8080')
    app.run(debug=False, port=server_port, host='0.0.0.0')
