from flask import Flask, render_template
from flask_mysqldb import MySQL

#Instanciando el objecto "app" de la clase "Flask"
#app=Flask(__name__)
app = Flask(__name__, static_url_path='', static_folder='static', template_folder='templates')

app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']=''
app.config['MYSQL_DB']='ferreteria'
app.config['MYSQL_CURSORCLASS']='DictCursor'
app.config['MYSQL_PORT']=3306
#-->secret_key: Indica como esta protegida nustra seccion de conexion
#-->app.secret_key='mysecretkey' -->Si esto no se establece PYTHOM no permite enviar mensajes entre vistas...
app.secret_key='mysecretkey'
mysql=MySQL(app)

@app.route('/')
def index():
    cursor=mysql.connection.cursor()
    cursor.callproc('SP_PRODUCTO_Q01')
    data=cursor.fetchall()
    cursor.close()
    return render_template('index.html', data=data)

@app.route('/producto/<id>')
def mostrar_producto(id):
    cursor=mysql.connection.cursor()
    cursor.callproc('SP_PRODUCTO_Q02',id)
    data=cursor.fetchall()
    cursor.close()

    cursor2 = mysql.connection.cursor()
    cursor2.callproc('SP_PRODUCTO_Q03',id)
    caracteristicas =cursor2.fetchall()

    cursor2.close()

    return render_template('producto.html', producto=data[0], producto_caracteristicas=caracteristicas)

if __name__=='__main__':
    app.run(debug=True, port=5000)

