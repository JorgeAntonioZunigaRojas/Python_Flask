from flask import Flask, request, session, redirect, url_for, render_template
from flask_mysqldb import MySQL
import os

app = Flask(__name__,
            static_url_path='',
            static_folder='static',
            template_folder='templates')

# Configuracion a MySQL LOCAL
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'comercio'
app.config['MYSQL_PORT'] = 3306
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'

'''
# Configuracion a MySQL NUBE
app.config['MYSQL_HOST'] = 'q3vtafztappqbpzn.cbetxkdyhwsb.us-east-1.rds.amazonaws.com'
app.config['MYSQL_USER'] = 'xd0c7pmv8b3d32k6'
app.config['MYSQL_PASSWORD'] = 'i1qlhbf8eofkb4hu'
app.config['MYSQL_DB'] = 'yl89iw5woe8gn40h'
app.config['MYSQL_PORT'] = 3306
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
'''

mysql = MySQL(app)

@app.route('/')
def index():
    return redirect(url_for('login'))

@app.route('/login', methods=['GET', 'POST'])
def login():
    msg = ""
    if request.method == "POST" and 'username' in request.form and 'password' in request.form:
        username = request.form['username']
        password = request.form['password']
        cur = mysql.connection.cursor()
        cur.execute('SELECT * FROM usuarios WHERE usuario= %s AND password =%s', (username, password))
        cur.callproc("login", [username, password])
        usuarios = cur.fetchone()
        if usuarios:
            session['loggedin'] = True
            session['id'] = usuarios['codigo']
            session['username'] = usuarios['usuario']
            # return
            return redirect(url_for('home'))
        else:
            msg = 'Usuario No Existe en la BD'
    return render_template('login.html', msg=msg)


@app.route('/home')
def home():
    #chequear si el usuario esta logeado
    if 'loggedin' in session:
        return render_template('home.html', username=session['username'])
    return redirect(url_for('login'))

#https://flask.palletsprojects.com/en/1.1.x/patterns/fileuploads/

@app.route('/profile')
def profile():
    if 'loggedin' in session:
        cur = mysql.connection.cursor()
        cur.callproc('usuario_codigo',[session['id']])
        usuario = cur.fetchone()
        return render_template('profile.html',usuario=usuario)
    return redirect(url_for('login'))

@app.route('/logout')
def logout():
    # Remover los datos de la session
    session.pop('loggedin', None)
    session.pop('id', None)
    session.pop('username', None)
    # Redireccionar al Login
    return redirect(url_for('login'))

app.config["IMAGE_UPLOADS"] = "/Tecsup-codiGO/Python_Flask/Server_Nube/APP/static/img"

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

                print(app.config["IMAGE_UPLOADS"])

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

@app.route('/editar', methods=['GET', 'POST'])
def editar():
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

@app.route('/producto')
def producto():
    cur=mysql.connection.cursor()
    resultado=cur.execute("select * from productos")
    productos=cur.fetchall()
    cur.close()

    if len(productos)>0:
        return render_template('productos.html', prod=productos)
    else:
        msg='No existe productos que mostrar'

@app.route('/agregarproducto', methods=['POST'])
def agregar_producto():
    categoria = request.form['categoria']
    nombre = request.form['nombre']
    descripcion = request.form['descripcion']
    precio = request.form['precio']
    stock = request.form['stock']
    archivo = request.files["image"]
    archivo.save(os.path.join(app.config["IMAGE_UPLOADS"], archivo.filename))
    cur = mysql.connection.cursor()
    cur.callproc('sp_producto_i01', [categoria, nombre, descripcion, precio, stock, archivo.filename])
    mysql.connection.commit()
    cur.close()
    return redirect(url_for('producto'))

@app.route('/eliminar_producto/<int:id_data>', methods=['GET'])
def eliminar_producto(id_data):
    cur = mysql.connection.cursor()
    script_sql="delete from productos where cod="+str(id_data)
    print(script_sql)
    cur.execute(script_sql)
    mysql.connection.commit()
    cur.close()
    return redirect(url_for('producto'))

@app.route('/editar_producto', methods=['POST'])
def editar_producto():
    codigo = request.form['codigo']
    categoria = request.form['categoria']
    nombre = request.form['nombre']
    descripcion = request.form['descripcion']
    precio = request.form['precio']
    stock = request.form['stock']
    archivo = request.files["image"]
    cur = mysql.connection.cursor()
    cur.execute("update productos set categoria=%s, nombre=%s, descripcion=%s, precio=%s, stock=%s where cod=%s", (categoria, nombre, descripcion, precio, stock, codigo))
    mysql.connection.commit()
    cur.close()
    return redirect(url_for('producto'))

if __name__ == "__main__":
    app.secret_key = 'codigo2020'
    app.run(debug=True, port=7000)


