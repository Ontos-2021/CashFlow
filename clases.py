class Billetera:
    def __init__(self, usuario, saldo_inicial=0):
        self.dueño = usuario
        self.saldo = saldo_inicial

    def __str__(self):
        return f"Soy una billetera con ${self.saldo} de saldo"

    def ingresar_dinero(self, monto):
        self.saldo += monto
        print(f"Se ha ingresado ${monto} a la billetera de {self.dueño}")

    def gastar_dinero(self, monto):
        self.saldo -= monto

    def vaciar_billetera(self):
        self.saldo = 0


class Usuario:
    def __init__(self, nombre, profesion, edad=int):
        self.nombre = nombre
        self.profesion = profesion
        self.billetera = Billetera(self, profesion.saldo_inicial)
        self.edad = edad

    def __str__(self):
        return self.nombre


class Profesion:
    def __init__(self, nombre, saldo_inicial):
        self.nombre = nombre
        self.saldo_inicial = saldo_inicial
