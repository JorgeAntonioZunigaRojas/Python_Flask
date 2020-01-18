from flask import Flask, render_template, request, redirect, url_for, flash
from flask_mysqldb import MySQL

app=Flask(__name__)

#3-Configuracion de coneccion
#3.1-Servidor
app.config['MYSQL_HOST']='localhost'
#3.2-Usuario
app.config['MYSQL_USER']='root'
#3.3-Contraseña del usuario
app.config['MYSQL_PASSWORD']=''
#3.4-Base de datos
app.config['MYSQL_DB']='AGENDA'
#3.5-Configurar la informacion a conectarse en modo diccionario
app.config['MYSQL_CURSORCLASS']='DictCursor'
#3.6-Puerto
app.config['MYSQL_PORT']=3306
#3.7-Crear el objeto mysql que tendra la aplicacion conectada al servidor
mysql=MySQL(app)

# settings
# -->Sirve para indicar como esta protegida nuestra seccion de coneccion
# -->app.secret_key="mysql" --> si esto no se establece python no permite enviar mensajes entre vistas.
app.secret_key="mysecretkey"

@app.route('/')
def index():
    cur=mysql.connection.cursor()
    cur.execute("Select id_contacto, nombre, telefono, email From Contacto")
    data=cur.fetchall()
    return render_template('index.html', contacts=data)

@app.route('/add_contact', methods=['POST'])
def add_contact():
    print(request.method)
    if request.method=='POST':
        nombre=request.form["txt_nombre"]
        telefono = request.form["txt_telefono"]
        email = request.form["txt_email"]
        cursor=mysql.connection.cursor()
        cursor.execute('INSERT INTO CONTACTO(NOMBRE, TELEFONO, EMAIL) VALUES(%s, %s, %s)',(nombre,telefono,email))
        mysql.connection.commit()
        flash('Contact Added successfully') #Permite enviar mensajes entre vistas...!!!
        return redirect(url_for('index'))

    return 'NO entro al IF'

@app.route('/delete/<string:id>')
def delete_contact(id):
    cur=mysql.connection.cursor()
    cur.execute('Delete From contacto where id_contacto={}'.format(id))
    mysql.connection.commit()
    flash('Contact removed successfully')
    return redirect(url_for('index'))

@app.route('/edit/<id>')
def get_contact(id):
    cur=mysql.connection.cursor()
    cur.execute('Select * From contacto where id_contacto={}'.format(id))
    data=cur.fetchall()
    return render_template('edit_contact.html', contact=data[0])

@app.route('/update/<id>', methods=['POST'])
def update_contact(id):
    if request.method=='POST':
        name = request.form['txt_nombre']
        phone = request.form['txt_telefono']
        email = request.form['txt_email']

        cur=mysql.connection.cursor()
        cur.execute("Update contacto set nombre='{}', telefono='{}', email='{}' where id_contacto={}".format(name,phone,email,id))
        mysql.connection.commit()
        flash('Contacto Updated Successfull')
        return redirect(url_for('index'))

if __name__=='__main__':
    app.run(debug=True, port=7000)
