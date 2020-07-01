import wollok.game.*
import personaje.*
import visualScreen.*
import cronometro.*

object control {
	method controlar() {
		if (personaje.vida() > 0) {
			cronometro.sumar()
		}
		else { 
			console.println("Perdiste, sobreviviste: " + minutos.numero() + ":" +
							segundos.numero() + " y tu puntaje es: " + personaje.puntos())
			game.clear()
			visualScreen.inicializar(gameOver)
		}
	}
}