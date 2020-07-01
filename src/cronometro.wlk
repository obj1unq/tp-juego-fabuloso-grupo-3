import wollok.game.*
import personaje.*
import visualScreen.*

object cronometro {
	
	method ponerCronometro() {
		minutos.poner()
		segundos.poner()
	}
	
	method sumar() {
		if (segundos.numero() == 59) { 
			segundos.ponerEnCero()
			minutos.sumar()
		}
		else { segundos.sumar() }
	}
}

class Contador {
	var property position = game.at(0,0)
	var property image = "Numeros/num-0.png"
		
	var numero = 0
	
	method numero() = numero
	
	method sumar() {
		numero += 1
		image = "Numeros/num-" + numero + ".png"
	}
	
	method poner() {
		position = game.at(self.columna(), game.height() - 1)
		game.addVisual(self)
	}
	
	method columna()
}

object minutos inherits Contador {
	
	override method columna() = game.height() - 2
}

object segundos inherits Contador {

	override method columna() = game.height() - 1
	
	method ponerEnCero() {
		numero = 0
		image = "Numeros/num-0.png"
	}
}