from flask import Flask
app=Flask(__name__)
@app.route("/") #--> Ruta Raiz
def index():
    return "funcion run especificando parametros"
'''
Para visualizar los cambios realizados en el codigo es necesario detener e iniciar el servidor
--> El parametro "debug=True" (valor por defecto debug) Detecta cambios realizados y reinicia el servidor para poder visualizar estos cambios realizados al codigo.
--> En algunos caso cuando los cambios de codigo son muy grandes sera necesario detener e iniciar el servidor manualmente...
--> El parametro "port" por defecto es "5000" pero podemos cambiarlo a: 3000, 7000, 8000, etc...
--> El parametro "host" por defecto su valor es "127.0.0.1" en algunos servidores es host='0.0.0.0'" 
'''

if __name__=="__main__":
    app.run(debug=True, port=5000)
    #app.run(debug=True, port=5000, host="0.0.0.0")
