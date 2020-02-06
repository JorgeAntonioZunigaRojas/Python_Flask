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
app.config['MYSQL_DB'] = 'villasur'
app.config['MYSQL_PORT'] = 3306
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
app.config["IMAGE_UPLOADS"] = "/JZUNIGA/Python_Flask_Mysql/VILLASUR/APP/static/img"
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
    cursor = mysql.connection.cursor()
    script_sql = "select id_categoria From producto group by id_categoria order by count(id_categoria) desc;"
    cursor.execute(script_sql)
    registro = cursor.fetchone()
    cursor.close()
    id_categoria = 0
    if registro:
        id_categoria = registro['id_categoria']
    return redirect(url_for('principal', id_data=id_categoria))


@app.route('/principal/<int:id_data>', methods=['GET'])
def principal(id_data):
    session_estado = 0
    carrito_items=[]

    if ('conectado' in session):
        session_estado = 1

        cursor = mysql.connection.cursor()
        cursor.callproc("sp_carrito_items_q01", [session['id_usuario']])
        carrito_items = cursor.fetchall()
        cursor.close()

    cursor = mysql.connection.cursor()
    cursor.callproc("sp_categoria_q03", [id_data])
    categoria_nombre = cursor.fetchone()['nombre']
    cursor.close()

    cursor = mysql.connection.cursor()
    cursor.callproc("sp_categoria_q02")
    categorias_activas = cursor.fetchall()
    cursor.close()

    cursor = mysql.connection.cursor()
    cursor.callproc("sp_producto_q03", [id_data])
    productos_x_categoria = cursor.fetchall()
    cursor.close()

    lista=[]
    for item in carrito_items:
        lista.append(item['id_producto'])

    return render_template('principal.html', session_estado=session_estado, session=session, categorias=categorias_activas, productos=productos_x_categoria, categoria_seleccionada=categoria_nombre, carrito_items=lista)


@app.route('/login', methods=['GET', 'POST'])
def login():
    msg = ""
    if request.method == "POST":
        idusuario = request.form['txt_idusuaio']
        contraseña = request.form['txt_contraseña']

        cursor = mysql.connection.cursor()
        cursor.callproc("sp_usuario_q02", [idusuario, contraseña])
        registro = cursor.fetchone()
        cursor.close()

        if registro:
            session['conectado'] = True
            session['id_usuario'] = registro['id_usuario']
            session['tipo_usuario'] = registro['tipo_usuario']
            session['nombre'] = registro['nombre']
            session['dni'] = registro['dni']
            session['email'] = registro['email']
            session['foto'] = registro['foto']
            return redirect(url_for('index'))
        else:
            msg = 'Usuario y/o contraseña incorrecta(s)...!!!.'
    return render_template('login.html', session_estado=0, msg=msg)


@app.route('/logout')
def logout():
    session.pop('conectado', None)
    session.pop('id_usuario', None)
    session.pop('tipo_usuario', None)
    session.pop('nombre', None)
    session.pop('dni', None)
    session.pop('email', None)
    session.pop('foto', None)
    return redirect(url_for('index'))


@app.route('/signup', methods=['GET', 'POST'])
def signup():
    msg = ""
    if request.method == "POST":
        tipo_usuario = 'cliente'
        id_usuario = request.form['txt_idusuario']
        contraseña = request.form['txt_contraseña']
        dni = request.form['txt_dni']
        nombre = request.form['txt_nombre']
        email = request.form['txt_email']
        archivo = request.files["image"]
        archivo_extension = archivo.filename.rsplit('.', 1)[1].lower()
        foto = ('u' + id_usuario + '.' + archivo_extension).lower()

        cursor = mysql.connection.cursor()
        cursor.callproc("sp_usuario_q01", [id_usuario, dni])
        registro = cursor.fetchall()
        cursor.close()

        if len(registro) == 0:
            cursor = mysql.connection.cursor()
            cursor.callproc("sp_usuario_i01", [id_usuario, contraseña, tipo_usuario, dni, nombre, email, foto])
            mysql.connection.commit()
            cursor.close()
            archivo.save(os.path.join(app.config["IMAGE_UPLOADS"], foto))
            msg = "Usuario registrado correctamente...!!!"
        else:
            msg = "El usuario ya existe..!!!"
    return render_template('signup.html', session_estado=0, msg=msg)


@app.route('/categoria')
def categoria():
    cursor = mysql.connection.cursor()
    registros = cursor.callproc('sp_categoria_q01')
    registros = cursor.fetchall()
    cursor.close()
    return render_template('categoria.html', session_estado=1, categorias=registros)


@app.route('/agregar_categoria', methods=['POST'])
def agregar_categoria():
    cursor = mysql.connection.cursor()
    nombre = request.form['txt_nombre']
    estado = request.form['txt_estado']

    resultado = cursor.callproc("sp_categoria_i01", [nombre, estado])
    mysql.connection.commit()
    cursor.close()
    return redirect(url_for('categoria'))


@app.route('/modificar_categoria', methods=['POST'])
def modificar_categoria():
    cursor = mysql.connection.cursor()
    codigo = request.form['txt_codigo']
    nombre = request.form['txt_nombre']
    estado = request.form['txt_estado']
    resultado = cursor.callproc("sp_categoria_u01", [codigo, nombre, estado])
    mysql.connection.commit()
    cursor.close()
    return redirect(url_for('categoria'))


@app.route('/eliminar_categoria/<int:id_data>', methods=['GET'])
def eliminar_categoria(id_data):
    cursor = mysql.connection.cursor()
    cursor.callproc('sp_categoria_d01', [id_data])
    mysql.connection.commit()
    cursor.close()
    return redirect(url_for('categoria'))


@app.route('/producto')
def producto():
    cursor = mysql.connection.cursor()
    cursor.callproc('sp_producto_q01')
    registros = cursor.fetchall()
    cursor.close()

    cursor = mysql.connection.cursor()
    cursor.callproc('sp_categoria_q01')
    categorias = cursor.fetchall()
    cursor.close()

    return render_template('producto.html', session_estado=1, productos=registros, categorias=categorias)


@app.route('/agregar_producto', methods=['POST'])
def agregar_producto():
    categoria = request.form['cb_categoria']
    id_categoria=int(categoria.rsplit('-', 1)[0])
    nombre = request.form['txt_nombre']
    marca = request.form['txt_marca']
    descripcion = request.form['txt_descripcion']
    precio = request.form['txt_precio']
    stock = request.form['txt_stock']
    unidad = request.form['txt_unidad']
    archivo = request.files['image']
    archivo_extension = archivo.filename.rsplit('.', 1)[1].lower()

    cursor = mysql.connection.cursor()
    cursor.callproc("sp_producto_gen_id")
    id_producto = cursor.fetchone()['codigo_generado']
    cursor.close()

    archivo_nombre = 'p' + str(id_producto) + '.' + archivo_extension

    cursor = mysql.connection.cursor()
    cursor.callproc("sp_producto_i01",
                    [id_producto, id_categoria, nombre, marca, descripcion, precio, unidad, stock, archivo_nombre])
    mysql.connection.commit()
    cursor.close()

    archivo.save(os.path.join(app.config["IMAGE_UPLOADS"], archivo_nombre))
    return redirect(url_for('producto'))


@app.route('/modificar_producto', methods=['POST'])
def modificar_producto():
    id_producto = request.form['txt_codigo']
    categoria = request.form['cb_categoria']
    id_categoria = int(categoria.rsplit('-', 1)[0])
    nombre = request.form['txt_nombre']
    marca = request.form['txt_marca']
    descripcion = request.form['txt_descripcion']
    precio = request.form['txt_precio']
    stock = request.form['txt_stock']
    unidad = request.form['txt_unidad']
    archivo_nombre = ''
    cursor = mysql.connection.cursor()
    cursor.callproc("sp_producto_u01",
                    [id_producto, id_categoria, nombre, marca, descripcion, precio, unidad, stock, archivo_nombre])
    mysql.connection.commit()
    cursor.close()
    return redirect(url_for('producto'))


@app.route('/eliminar_producto/<int:id_data>', methods=['GET'])
def eliminar_producto(id_data):
    cursor = mysql.connection.cursor()
    cursor.callproc('sp_producto_q02', [int(id_data)])
    producto = cursor.fetchone()
    cursor.close()

    archivo = app.config["IMAGE_UPLOADS"] + '/' + producto['imagen']

    if os.path.exists(archivo):
        os.remove(archivo)

    cursor = mysql.connection.cursor()
    cursor.callproc('sp_producto_d01', [int(id_data)])
    mysql.connection.commit()
    cursor.close()
    return redirect(url_for('producto'))

@app.route('/agregar_carrito/<int:id_data>/<int:id_categoria>', methods=['GET'])
def agregar_carrito(id_data, id_categoria):
    cursor = mysql.connection.cursor()
    cursor.callproc('sp_carrito_agregar_producto', [session['id_usuario'], int(id_data)])
    mysql.connection.commit()
    cursor.close()
    return redirect(url_for('principal', id_data=id_categoria))

@app.route('/carrito')
def carrito():
    session_estado = 0
    carrito_items=[]

    if ('conectado' in session):
        session_estado = 1

        cursor = mysql.connection.cursor()
        cursor.callproc("sp_carrito_items_q01", [session['id_usuario']])
        carrito_items = cursor.fetchall()
        cursor.close()

    registros=[]
    return render_template('carrito.html', session_estado=session_estado, categorias=registros, carrito_items=carrito_items)

if __name__ == "__main__":
    app.secret_key = 'codigo2020'
    app.run(debug=True, port=7000)
