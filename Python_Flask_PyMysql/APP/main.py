from flask import Flask, render_template, request, url_for, redirect
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
#app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root@localhost/comercio'  # Puerto por defecto=3306
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root@localhost:3306/comercio'
# Creando el ORM de la BD
db = SQLAlchemy(app)
class Mentores(db.Model):
    __tablename__ = 'mentores'
    _id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    nombre = db.Column(db.String(50))
    correo = db.Column(db.String(100))
    def __init__(self, nom, email):
        self.nombre = nom
        self.correo = email

# Crear los Modelos=Tablas en la BD Asignada
db.create_all()

@app.route("/")
def index():
    return render_template("index.html")

@app.route("/List_All_Mentores")
def List_All_Mentores():
    mentores=Mentores.query.all()
    return render_template("List_Mentores.html", mentores=mentores)

@app.route('/Add_Mentores')
def Add_Mentores():
    return render_template("Add_Mentores.html")

@app.route("/Mentores_Add", methods=['GET', 'POST'])
def Mentores_Add():
    if request.method == "POST":
        nombre = request.form.get("nombre")
        correo = request.form.get("correo")
        if nombre and correo:
            objmentores = Mentores(nombre, correo)
            db.session.add(objmentores)
            db.session.commit()
    return redirect(url_for('index'))



app.run(debug=True, port=7000)

