import wollok.game.*
import personaje.*
import visualScreen.*
import cronometro.*
import dificultades.*

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
	
	method iniciar() {
		visualScreen.inicializar(presentacion)
		keyboard.enter().onPressDo({
			if (visualScreen.inicializada()) {
				visualScreen.quitar(presentacion)
				visualScreen.inicializar(dificultadScreen)
			}
		})
		keyboard.num1().onPressDo({
			if (visualScreen.inicializada()) {
				dificultad.dificultadActual(facil)
				visualScreen.quitar(dificultadScreen)
				inicio.newGame()
			}
		})
		keyboard.num2().onPressDo({
			if (visualScreen.inicializada()) {
				dificultad.dificultadActual(normal)
				visualScreen.quitar(dificultadScreen)
				inicio.newGame()
			}
		})
		keyboard.num3().onPressDo({
			if (visualScreen.inicializada()) {
				dificultad.dificultadActual(dificil)
				visualScreen.quitar(dificultadScreen)
				inicio.newGame()
			}
		})
	}
}

