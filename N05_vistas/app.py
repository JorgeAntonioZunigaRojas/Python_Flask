from flask import Flask, render_template
app=Flask(__name__)
@app.route("/")
def index():
    #-->render_template: Es una funcion que busca dentro de la carpeta "templates" el objecto (archivo) que se pone como parametro.
    #-->En este caso la funcion "render_template" busca dentro de la carpeta "templates" el archivo "index.html"
    return render_template("index.html")

if __name__=="__main__":
    app.run(debug=True)
