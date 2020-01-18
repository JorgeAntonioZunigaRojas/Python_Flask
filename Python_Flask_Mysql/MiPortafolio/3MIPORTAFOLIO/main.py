from flask import Flask
from flask import render_template
from flask_mysqldb import MySQL

app = Flask(__name__, static_url_path='', static_folder='static', template_folder='templates')
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = ''
app.config['MYSQL_DB'] = 'bd_miportafolio'
app.config['MYSQL_CURSORCLASS'] = 'DictCursor'
app.config['MYSQL_PORT']=3306
mysql = MySQL(app)

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/portafolio')
def portafolio():
    cur = mysql.connection.cursor()
    resultado = cur.execute("SELECT * FROM portafolio_datos d inner join portafolio_informacion i on i.datos_codigo=d.datos_codigo inner join portafolio_proyectos p on p.proyectos_codigo=i.proyectos_codigo inner join portafolio_experiencia e on e.experiencia_codigo=i.experiencia_codigo WHERE d.datos_codigo=2;")
    datos = cur.fetchall()  #--> datos = cur.fetchone() #-->Util para cuando la consulta solo retorna un registro.....!!!
    if resultado>0:
        return render_template('index.html', datos=datos)
    else:
        msg = "No Hay cursos que mostrar"
        return render_template('index.html', msg=msg)
    cur.close()

app.run(debug=True, port=8000)
