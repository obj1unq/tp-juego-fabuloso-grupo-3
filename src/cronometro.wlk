import wollok.game.*
import personaje.*

object cronometro {
	
	method ponerCronometro() {
		minutos.poner()
		segundos.poner()
	}
	
	method sumar() {
		if (personaje.vida() > 0) {
			if (segundos.numero() == 59) { 
				segundos.ponerEnCero()
				minutos.sumar()
			}
			else {
				segundos.sumar()
			}
			
		}
		else { 
			console.println("Perdiste, sobreviviste: " + minutos.numero() + ":" +
							segundos.numero() + " y tu puntaje es: " + personaje.puntos())
			game.clear()
		}
	}
}

class Reloj {
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

object minutos inherits Reloj {
	
	override method columna() = 5
}

object segundos inherits Reloj {

	override method columna() = 6
	
	method ponerEnCero() {
		numero = 0
		image = "Numeros/num-0.png"
	}
}