import wollok.game.*
import personaje.*
import cosasQueCaen.*
import lanzaProyectiles.*
import guarda.*
import vida.*
import cronometro.*
import dificultades.*

object visualScreen {
	var property image = "presentacion.png"
	var property position = game.at(2, 3)
	var inicializada = false
	
	method inicializada() = inicializada
	
	method inicializar() {
		if (!inicializada) {
			game.addVisual(self)
			inicializada = true
			self.ponerPersonaje()
			game.onTick(300, "personaje presentacion", {self.moverPersonaje()})
		}
	}
	
	method quitar() {
		if (inicializada) {
			game.removeVisual(self)
			inicializada = false
			game.removeVisual(personaje)
			game.removeTickEvent("personaje presentacion")
		}
	}
	
	method ponerPersonaje() {
		game.addVisual(personaje)
		personaje.position(game.at(0,2))
	}
	
	method moverPersonaje() {
		if(personaje.position().x() < game.width() - 1) {
			personaje.moverDerecha()
		}
		else { personaje.position(game.at(0,2)) }
	}
	
	method newGame() {
		//PERSONAJE
		personaje.image("elGuachinDeFrente.png")
		personaje.position(game.at(0,0))
		game.addVisual(personaje)
		
		//GUARDA
		guarda.ponerGuarda()
		
		//VIDA
		vidaPersonaje.mostrarVida()
		
		//CRONOMETRO
		cronometro.ponerCronometro()
		game.onTick(1000, "cronometro", { cronometro.sumar() })
		
		//PROYECTILES
		const piedraMueve = new PiedraQueSeMueve()
		game.onTick(dificultad.tiempoDeLanzamientoPiedraMovediza(), "piedraquesemueve", {piedraMueve.caer()})
		//lanzaPiedras.iniciar()
		game.onTick(dificultad.tiempoDeLanzamientoPiedrasEstaticas(),"piedraObstaculo", {lanzaPiedras.lanzar()})
		lanzaBolasDePinchos.iniciar()
		
		//MONEDAS
		controladorMonedas.inicio()
		
		//BOMBAS
		game.schedule(5000, {lanzaBombas.inicio()})
		const superBomba = new SuperBomba()
		game.onTick(dificultad.tiempoDeLanzamientoSuperBomba(),"superBomba",{superBomba.caer()})
		
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