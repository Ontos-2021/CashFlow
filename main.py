from clases import *


def main():
    # Creo una profesión
    ing = Profesion("Ingeniero Civil Industrial", 1000)

    # Creo un usuario
    usuario1 = Usuario("José Miguel Mercado Gutiérrez", ing, 26)

    # Imprimo el saldo del usuario

    print(f"El saldo del usuario es: ${usuario1.billetera.saldo}")

    # Le agrego $1.000 pesos más
    usuario1.billetera.ingresar_dinero(1000)

    print(f"El saldo del usuario es: ${usuario1.billetera.saldo}")


if __name__ == "__main__":
    main()
