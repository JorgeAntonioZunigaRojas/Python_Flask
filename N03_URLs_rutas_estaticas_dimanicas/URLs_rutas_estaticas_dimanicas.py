from flask import Flask

app=Flask(__name__)
@app.route("/") #--> Ruta Raiz
def index():
    return "Hola Mundo<br>Soy Jorge Antonio (TOÑO)"

@app.route("/hola") #--> Nueva ruta
def holassssss():
    return "Hola"

@app.route("/user/<usuario_nombre>")
def user(usuario_nombre):
    return "Buenos dias usuario: " + usuario_nombre

@app.route("/numero/<int:nro>")
def leer_numero(nro):
    return "El numero ingresado es: {}".format(nro)

@app.route("/usuario1/<id>/<nombre>") # SIN Especificar tipo de dato de los argumentos...
def leer_usuario1(id, nombre):
    return "DATOS DE USUARIO 1:<br>-ID: {}<br>-Nombre: {}".format(id, nombre)

@app.route("/usuario2/<int:id>/<string:nombre>") #Especificando tipo de dato de los argumentos...
def leer_usuario2(id, nombre):
    return "DATOS DE USUARIO 2:<br>-ID: {}<br>-Nombre: {}".format(id, nombre)

@app.route("/sumar_cadenas/<a>/<b>")
def sumar_cadenas(a,b):
    return "La suma de cadena es: {}".format(a+b)

@app.route("/sumar_enteros/<int:a>/<int:b>")
def sumar_enteros(a,b):
    return "La suma de cadena es: {}".format(a+b)

@app.route("/sumar_decimales/<float:a>/<float:b>")
def sumar_decimales(a,b):
    return "La suma de cadena es: {}".format(a+b)


if __name__=="__main__":
    app.run(debug=True, port=5000)
