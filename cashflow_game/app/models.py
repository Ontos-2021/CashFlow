from app import db


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
