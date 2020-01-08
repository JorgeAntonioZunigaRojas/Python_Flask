from flask import Flask, render_template
app=Flask(__name__)
@app.route("/")
def index():
    titulo="Home Usuario"
    lista=["Header", "Body", "Aside","footer"]
    #return render_template("index.html", parametro_titulo=titulo, parametro_lista=lista)
    return render_template("index_base.html", parametro_titulo=titulo, parametro_lista=lista)

if __name__=="__main__":
    app.run(debug=True)
