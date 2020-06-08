import wollok.game.*
import personaje.*
import cosasQueCaen.*
import lanzaProyectiles.*
import guarda.*
import vida.*
import cronometro.*

object visualScreen {
	var property image = "presentacion.png"
	var property position = game.at(2, 3)
	var inicializada = false
	
	method inicializada() = inicializada
	
	method inicializar() {
		if (!inicializada) {
			game.addVisual(self)
			inicializada = true
		}
	}
	
	method quitar() {
		if (inicializada) {
			game.removeVisual(self)
			inicializada = false
		}
	}
	
	method newGame() {
		//PERSONAJE
		game.addVisual(personaje)
		
		//GUARDA
		guarda.ponerGuarda()
		
		//VIDA
		vidaPersonaje.mostrarVida()
		
		//CRONOMETRO
		cronometro.ponerCronometro()
		game.onTick(1000, "cronometro", { cronometro.sumar() })
		
		//PROYECTILES
		lanzaPiedras.iniciar()
		lanzaBolasDePinchos.iniciar()
		
		//MONEDAS
		controladorMonedas.inicio()
		
		//BOMBAS
		game.schedule(5000, {lanzaBombas.inicio()})
		
		//BOTIQUIN
		game.onTick(40000,"apareceBotiquin",{botiquin.aparicion()})
		
		//PROGRAMACION
		keyboard.w().onPressDo { personaje.moverArriba() }
		keyboard.s().onPressDo { personaje.moverAbajo() }
		keyboard.a().onPressDo { personaje.moverIzquierda() }
		keyboard.d().onPressDo { personaje.moverDerecha() }
		
		game.onCollideDo(personaje, { otro => otro.colisionoCon(personaje) })
	}
}