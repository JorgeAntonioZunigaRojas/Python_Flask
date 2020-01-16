#1-Librerias a usar
from flask import Flask
from flask import render_template
from flask import request
from flask_mysqldb import MySQL #-->Libreria que permite conectarme a un servidor MySql

#2-Instanciamos el objecto de la clase Flask()
app=Flask(__name__)

#3-Configuracion de coneccion
#3.1-Servidor
app.config['MYSQL_HOST']='localhost'
#3.2-Usuario
app.config['MYSQL_USER']='root'
#3.3-Contraseña del usuario
app.config['MYSQL_PASSWORD']=''
#3.4-Base de datos
app.config['MYSQL_DB']='comercial_vinos'
#3.5-Configurar la informacion a conectarse en modo diccionario
app.config['MYSQL_CURSORCLASS']='DictCursor'
#3.6-Crear el objeto mysql que tendra la aplicacion conectada al servidor

#3.7-Puerto
app.config['MYSQL_PORT']=3307


'''
app = Flask(__name__)
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_PORT'] = 3306
app.config['MYSQL_USER'] = 'test'
app.config['MYSQL_PASS'] = 'test'
app.config['MYSQL_DB'] = 'world_x'
app.config['MYSQL_POOL_NAME'] = 'mysql_pool'
app.config['MYSQL_POOL_SIZE'] = 5
app.config['MYSQL_AUTOCOMMIT'] = True
'''


mysql=MySQL(app)

#4-Creamos una ruta
@app.route("/")
def index():
    return render_template('index.html')

@app.route("/tipo_documento_mtto", methods["GET","POST"])
def tipo_documento_mtto():
    if request.method=='GET':
        return render_template("tipo_documento_mtto.html")
    else:
        codigo=request.form[]
        nombre = request.form[]

@app.route("/tipo_documento_lista")
def tipo_documento_lista():
    #creando el cursor que se conectara al servidor
    micursor=mysql.connection.cursor()

    #Retorna 0 (si la consulta no retorna filas), Retorna 1 (si la consulta retorna filas)
    resultado=micursor.execute("SELECT @rownum:=@rownum+1 As Fila, T.id_tipodocumento as codigo, T.nombre as nombre FROM (SELECT @rownum:=0) R, tipo_documento T;")

    #Transforma to
    lista_tipo_documento=micursor.fetchall()

    if resultado>0:
        return render_template("tipo_documento_lista.html", parametro_tipo_documento=lista_tipo_documento)
    else:
        msg="No hay tipos de documentos que mostrar"
        return render_template("tipo_documento_lista.html", parametro_tipo_documento=msg)

    micursor.close()



#5-Ejecutamos el servidor de pruebas
#5-->El puerto por defecto es el 5000,
#5-->pero muchas este puerto esta en uso
#5-->por ello es recomendable establecer otros puertos ejemplo( 5000, 7000, 8000, etc )
app.run(debug=True, port=7000)
