# from ast import If
from cmath import log
from distutils.log import debug
import os
import rook
from flask import Flask
from flask import render_template, request
from currency_converter import CurrencyConverter

rook.start(token='1a43c7f087d9c43341653af043d498bc800f22a5bc6a70b1e0c0fe232b8b3b3e', labels={"env":"dev"})
# print("Rook Started")

app = Flask(__name__)
# region = os.environ.get("region")
region = "eu" # This is used to showcase Rookout


@app.route("/")
def form():

    return render_template("form.html")

@app.route("/", methods=["POST"])
def my_form_post():
    c = CurrencyConverter()

    euros = request.form["euros"]
    usd = round(c.convert(euros, "EUR", "USD"), 2)

    # region = os.environ.get("region")
    return render_template("form.html", euros=euros, usd=usd)
    
if __name__ == "__main__":
    # rook.start(token='1a43c7f087d9c43341653af043d498bc800f22a5bc6a70b1e0c0fe232b8b3b3e', labels={"env":"dev"})
    app.run(host="0.0.0.0", port=int(os.environ.get("PORT", 8080)))