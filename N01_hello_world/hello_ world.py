# importamos las liberias necesarias
from flask import Flask

# Instancia de Flask. Aplicación (creando un objecto de clase Flask)
app=Flask(__name__)

# Creamos nuestro primer route (ruta). '/' (ruta principal)
@app.route("/") #--> Ruta Raiz
def index():
    # Retornamos la respuesta
    return "Hola Mundo<br>Soy Jorge Antonio Zuñiga Rojas (TOÑO) primera pagina con Flask"

if __name__=="__main__":
    # Iniciamos la apicación en modo debug
    app.run()
