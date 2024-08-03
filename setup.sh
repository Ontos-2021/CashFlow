#!/bin/bash

# Crear la estructura de carpetas y archivos
mkdir -p cashflow_game/app/static
mkdir -p cashflow_game/app/templates
mkdir -p cashflow_game/instance
mkdir -p cashflow_game/migrations
touch cashflow_game/app/__init__.py
touch cashflow_game/app/models.py
touch cashflow_game/app/routes.py
touch cashflow_game/app/forms.py
touch cashflow_game/app/utils.py
touch cashflow_game/instance/config.py
touch cashflow_game/config.py
touch cashflow_game/run.py
touch cashflow_game/requirements.txt
touch cashflow_game/.gitignore

# Escribir contenido inicial en los archivos

echo "from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate

db = SQLAlchemy()
migrate = Migrate()

def create_app():
    app = Flask(__name__)
    app.config.from_object('config.Config')
    db.init_app(app)
    migrate.init_app(app, db)

    with app.app_context():
        from . import routes
        db.create_all()

    return app
" > cashflow_game/app/__init__.py

echo "from app import db

class Jugador(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    nombre = db.Column(db.String(50), nullable=False)
    ocupacion = db.Column(db.String(50), nullable=False)
    salario = db.Column(db.Integer, nullable=False)
    gastos = db.Column(db.Integer, nullable=False)
    ingresos_pasivos = db.Column(db.Integer, nullable=False)
    activos = db.Column(db.String(200), nullable=True)
    pasivos = db.Column(db.String(200), nullable=True)
    efectivo = db.Column(db.Integer, nullable=False)
    posicion = db.Column(db.Integer, nullable=False)
    edad = db.Column(db.Integer, nullable=False)
    tiempo = db.Column(db.Integer, nullable=False)  # en semanas

class Carta(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    tipo = db.Column(db.String(50), nullable=False)
    descripcion = db.Column(db.String(200), nullable=False)
    costo = db.Column(db.Integer, nullable=False)
    retorno = db.Column(db.Integer, nullable=False)
    efecto = db.Column(db.String(200), nullable=False)
" > cashflow_game/app/models.py

echo "from flask import render_template, redirect, url_for
from app import app

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/game')
def game():
    return render_template('game.html')
" > cashflow_game/app/routes.py

echo "SECRET_KEY = 'your_secret_key'
SQLALCHEMY_DATABASE_URI = 'sqlite:///site.db'
SQLALCHEMY_TRACK_MODIFICATIONS = False
" > cashflow_game/config.py

echo "FLASK_APP=run.py
FLASK_ENV=development
" > cashflow_game/.env

echo "from app import create_app

app = create_app()

if __name__ == '__main__':
    app.run(debug=True)
" > cashflow_game/run.py

echo "flask
flask_sqlalchemy
flask_migrate
python-dotenv
" > cashflow_game/requirements.txt

echo "__pycache__/
instance/
*.pyc
*.pyo
.env
venv/
" > cashflow_game/.gitignore

# Crear plantillas básicas

echo "<!DOCTYPE html>
<html lang=\"en\">
<head>
    <meta charset=\"UTF-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
    <title>Cashflow Game</title>
    <link rel=\"stylesheet\" href=\"{{ url_for('static', filename='style.css') }}\">
</head>
<body>
    <header>
        <h1>Cashflow Game</h1>
        <nav>
            <ul>
                <li><a href=\"{{ url_for('index') }}\">Home</a></li>
                <li><a href=\"{{ url_for('game') }}\">Game</a></li>
            </ul>
        </nav>
    </header>
    <main>
        {% block content %}{% endblock %}
    </main>
</body>
</html>
" > cashflow_game/app/templates/base.html

echo "{% extends 'base.html' %}

{% block content %}
<h2>Welcome to Cashflow Game</h2>
<p>This is the homepage of the Cashflow game.</p>
{% endblock %}
" > cashflow_game/app/templates/index.html

echo "{% extends 'base.html' %}

{% block content %}
<h2>Game Page</h2>
<p>This is where the game will be played.</p>
{% endblock %}
" > cashflow_game/app/templates/game.html

echo "/* Add your custom styles here */
body {
    font-family: Arial, sans-serif;
}
header {
    background-color: #4CAF50;
    color: white;
    padding: 1rem;
    text-align: center;
}
nav ul {
    list-style-type: none;
    padding: 0;
}
nav ul li {
    display: inline;
    margin-right: 1rem;
}
nav ul li a {
    color: white;
    text-decoration: none;
}
" > cashflow_game/app/static/style.css
