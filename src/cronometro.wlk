import wollok.game.*
import personaje.*

object cronometro {
	
	method ponerCronometro() {
		game.addVisual(minutos)
		game.addVisual(segundos)
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
							segundos.numero() + " y tu puntaje es:" + personaje.puntos())
			game.schedule(3000, {game.clear() })
		}
	}
}

object minutos {
	var property position = game.at(5, game.height() - 1)
	var property image = "Numeros/num-0.png"
	
	var numero = 0
	
	method numero() = numero
	
	method sumar() {
		numero += 1
		image = "Numeros/num-" + numero + ".png"
	}
}

object segundos {
	var property position = game.at(6, game.height() - 1)
	var property image = "Numeros/num-0.png"
	
	var numero = 0
	
	method numero() = numero
	
	method sumar() {
		numero += 1
		image = "Numeros/num-" + numero + ".png"
	}
	
	method ponerEnCero() {
		numero = 0
		image = "Numeros/num-0.png"
	}
}