from flask import Flask, render_template
app= Flask(__name__)

@app.route("/")
def index():
    return render_template('index.html')

@app.route("/inicio")
def mostrar_inicio():
    return render_template('inicio.html')

@app.route("/estudios")
def mostrar_estudios():
    return render_template('estudios.html')

@app.route("/experiencia1")
def mostrar_experiencia1():
    return render_template('experiencia1.html')

@app.route("/experiencia2")
def mostrar_experiencia2():
    return render_template('experiencia2.html')

@app.route("/experiencia3")
def mostrar_experiencia3():
    return render_template('experiencia3.html')

@app.route("/experiencia4")
def mostrar_experiencia4():
    return render_template('experiencia4.html')

@app.route("/referencias")
def mostrar_referencias():
    return render_template('referencias.html')


app.run(debug=True, port=5000)
