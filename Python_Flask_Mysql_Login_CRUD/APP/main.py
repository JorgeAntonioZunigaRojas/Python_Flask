from flask import Flask, render_template, request, session, redirect, url_for
from flask_mysqldb import MySQL, MySQLdb
import os
from werkzeug.utils import secure_filename

app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'msci'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
app.config["IMAGE_UPLOADS"] = "/Tecsup-codiGO/Python_Flask/Python_Flask_Mysql_Login_CRUD/APP/static/img"
app.config['ALLOWED_EXTENSIONS'] = {'png', 'jpg', 'jpeg', 'gif'}
app.config['MAX_CONTENT_LENGTH'] = (16 * 1024 * 1024) # 16 megabytes (16 * 1024 * 1024)
mysql = MySQL(app)

def validar_extencion_archivo(nombre_extencion_archivo):
    return ('.' in nombre_extencion_archivo) and (nombre_extencion_archivo.rsplit('.', 1)[1].lower() in app.config['ALLOWED_EXTENSIONS'])

def validar_tamaxo_archivo(archivo):
    return app.config['MAX_CONTENT_LENGTH']>len(archivo.read())

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    msg = ""
    if request.method == 'GET':
        return render_template('register.html')
    else:
        ar_name = request.form['name']
        ar_email = request.form['email']
        ar_password = request.form['password']
        ar_phone = request.form['phone']
        file_image = request.files["image"]

        if (not ar_name):
            msg = 'Falta ingresar [Name]... Por Favor Llene Los Campos en el Formulario!'
        elif (not ar_email):
            msg = 'Falta ingresar [Email]... Por Favor Llene Los Campos en el Formulario!'
        elif (not ar_password):
            msg = 'Falta ingresar [Password]... Por Favor Llene Los Campos en el Formulario!'
        elif (not ar_phone):
            msg = 'Falta ingresar [Phone]... Por Favor Llene Los Campos en el Formulario!'
        elif validar_extencion_archivo(file_image.filename) == False:
            msg = 'El archivo seleccionado es incorrecto (extencion incorrecta)!'
        elif not validar_tamaxo_archivo(file_image):
            msg = 'El archivo seleccionado es incorrecto (sobrepasa el tamaño maximo 10 kb)!'
        else:
            if request.files:
                #image.save(os.path.join(app.config["IMAGE_UPLOADS"], image.filename))
                #image.save(os.path.join(app.config["IMAGE_UPLOADS"], secure_filename(image.filename)))

                file_image.save(os.path.join("static/img", secure_filename(file_image.filename)))

                ar_image = file_image.filename
                cursor_user = mysql.connection.cursor()
                cursor_user.callproc('sp_tguser_i01', (ar_name, ar_email, ar_password, ar_phone, ar_image))
                mysql.connection.commit()
                cursor_user.close()
                msg = 'El usuario se Grabo con Exito'
            else:
                msg = 'Debe seleccionar una imagen para su perfil'
    return render_template('register.html', msg=msg)


'''
@app.route('/registrar', methods=['GET', 'POST'])
def registrar():
    msg = ""
    if request.method == 'POST' and 'username' in request.form and 'password' in request.form and 'email' in request.form:
        username = request.form['username']
        password = request.form['password']
        email = request.form['email']
        cur = mysql.connection.cursor()
        cur.callproc('usuario_user', [username])
        account = cur.fetchone()
        cur.close()
        if account:
            msg = "Usuario Ya Existe"
        elif not username or not password or not email:
            msg = "Debe Llenar todos los campos del Formulario"
        else:
            if request.files:
                image = request.files["image"]
                image.save(os.path.join(app.config["IMAGE_UPLOADS"], image.filename))
                cur = mysql.connection.cursor()
                cur.callproc('insertar_usuario', [username, password, email, 'img/' + image.filename])
                mysql.connection.commit()
                msg = 'El usuario se Grabo con Exito'
            else:
                msg = 'Debe seleccionar una imagen para su perfil'

    elif request.method == 'POST':
        msg = 'Por Favor Llene Los Campos en el Formulario!'
    return render_template('registrar.html', msg=msg)

'''


@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']
        cursor_login = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor_login.execute("select id, name, email, password, foto, status from tguser where email=%s", (email,))
        tuple_user = cursor_login.fetchall()  # cursor_login.fetchone()
        cursor_login.close()

        if len(tuple_user) > 0:
            user = tuple_user[0]
            if password == user["password"]:
                session['name'] = user['name']
                session['email'] = user['email']
                return render_template('home.html')
            else:
                return "Error password and email not match"
        else:
            return "Error user not found"
    else:
        return render_template('login.html')


@app.route('/logout')
def logout():
    session.clear()
    return render_template("home.html")


if __name__ == '__main__':
    app.secret_key = "^A%DJAJU^JJ123"
    app.run(debug=True, port=7000)
