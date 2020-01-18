from flask import Flask, render_template, request, url_for, redirect
from flask_mysqldb import MySQL

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'flaskdb'


#3-Configuracion de coneccion
#3.1-Servidor
app.config['MYSQL_HOST']='localhost'
#3.2-Usuario
app.config['MYSQL_USER']='root'
#3.3-Contraseña del usuario
app.config['MYSQL_PASSWORD']=''
#3.4-Base de datos
app.config['MYSQL_DB']='flaskdb'
#3.5-Configurar la informacion a conectarse en modo diccionario
app.config['MYSQL_CURSORCLASS']='DictCursor'
#3.6-Crear el objeto mysql que tendra la aplicacion conectada al servidor

#3.7-Puerto
app.config['MYSQL_PORT']=3307

mysql = MySQL(app)

@app.route('/')
def home():
    cur = mysql.connection.cursor()
    cur.execute("SELECT * FROM computer")
    rv = cur.fetchall()
    cur.close()
    return render_template('home.html', computers=rv)

if __name__ == '__main__':
    app.run(debug=True)
