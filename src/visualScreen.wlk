import wollok.game.*
import personaje.*
import cosasQueCaen.*
import lanzaProyectiles.*
import guarda.*
import vida.*
import cronometro.*
import dificultades.*
import control.*

object visualScreen {
	var property inicializada = false
	
	method inicializar(_evento) {
		if (!inicializada) {
			game.addVisual(_evento)
			inicializada = true
			_evento.inicializar()
		}
	}
	
	method quitar(_evento) {
		if (inicializada) {
			game.removeVisual(_evento)
			inicializada = false
			_evento.quitar()
		}
	}
}

object presentacion {
	var property image = "presentacion.png"
	var property position = game.at(2, 3)
	
	method inicializar() {
		self.ponerPersonaje()
		game.onTick(300, "personaje presentacion", {self.moverPersonaje()})
	}
	
	method quitar() {
		game.removeVisual(personaje)
		game.removeTickEvent("personaje presentacion")
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
}

object dificultadScreen {
	var property image = "artenuevo1.png"
	var property position = game.at(1, 2)
	
	method inicializar() {
	}
	
	method quitar() {
	}
}

object gameOver {
	var property image = "gameOver2.png"
	var property position = game.at(2, 3)
	
	method inicializar() {
	}
	
	method quitar() {
	}
}

object inicio {
	method newGame() {
		//CONTROLADOR
		game.onTick(1000, "controlador", { control.controlar() })
		
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