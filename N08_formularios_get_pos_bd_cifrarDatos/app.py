from flask import Flask, render_template, request
from flask_sqlalchemy import SQLAlchemy
from werkzeug.security import generate_password_hash, check_password_hash
import os

dbdir="sqlite:///" + os.path.abspath(os.getcwd()) + "/database.db"

app=Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"]= dbdir
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"]=False
db=SQLAlchemy(app)

class Users(db.Model):
    id=db.Column(db.Integer, primary_key=True)
    username=db.Column(db.String(50), unique=True, nullable=False)
    password=db.Column(db.String(50), nullable=False)

@app.route("/signup", methods=["GET", "POST"])
def signup():
    if request.method == "POST":
        hashed_pw=generate_password_hash(request.form["password"], method="sha256")
        new_user=Users(username=request.form["usuario_nombre"], password=hashed_pw)
        db.session.add(new_user)
        db.session.commit()
        return "You've registered sucessfully...!!!"

    return render_template("signup.html")

@app.route("/login", methods=["GET","POST"])
def login():
    if request.method=="POST":
        user=Users.query.filter_by(username=request.form["usuario_nombre"]).filter()
        if user and check_password_hash(request.form["password"], user.password):
            return "Your are logged in"
        return "Your credentials are invalid, check and try again"
    return render_template("login.html")

if __name__=="__main__":
    db.create_all()
    app.run(debug=True)
