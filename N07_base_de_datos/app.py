from flask_sqlalchemy import SQLAlchemy
from flask import Flask, render_template
import os

dbdir="sqlite:///" + os.path.abspath(os.getcwd()) + "/database.db"

app=Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"]= dbdir
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"]=False
db=SQLAlchemy(app)

class Posts(db.Model):
    id=db.Column(db.Integer, primary_key=True)
    title=db.Column(db.String(50))

@app.route("/")
def index():
    titulo="Home Usuario"
    lista=["Header", "Body", "Aside","footer"]
    return render_template("index_base.html", parametro_titulo=titulo, parametro_lista=lista)

@app.route("/insert/default")
def insert_default():
    new_post=Posts(title="Default Title")
    db.session.add(new_post)
    db.session.commit()
    return "the default post was created = Se creo la publicacion predeterminada"

@app.route("/select/default")
def select_default():
    post=Posts.query.filter_by(id=1).first()
    print(post.title)
    return "Query donde...!"

if __name__=="__main__":
    db.create_all() # --> crea la base de datos "database.db" si ya existe no crea nada...
    app.run(debug=True)
