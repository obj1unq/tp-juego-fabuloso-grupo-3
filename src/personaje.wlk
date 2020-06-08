import wollok.game.*
import posicionAleatoria.*
import vida.*

object personaje {
	var property image = "elGuachinDeFrente.png"
	var property position = game.at(0,0)
	
	
	var property puntos = 0
	var property vida = 100
	var property reduccionDeVelocidad = 0
	
	method moverArriba(){
		if(position.y() < game.height() - 2){
			position = position.up(1)
		}
		image = "elGuachinArriba.png"
	}

	
	method moverAbajo(){
		if(position.y() > 0){
			position = position.down(1)
		}
		image = "elGuachinDeFrente.png"
	}
	
	method moverDerecha(){
		if(position.x() < game.width() - 1){
			position = position.right(1)
		}
		image = "elGuachinDerecha.png"
	}
	
	method moverIzquierda(){
		if(position.x() > 0){
			position = position.left(1)
		}
		image = "elGuachinIzquierda.png"
	}
	
	method perderVida(cantidad){
		vida = (vida - cantidad).max(0)
		vidaPersonaje.modificarVida()
	}
	
	method ganarVida(cantidad){
		vida =(vida + cantidad).min(100)
		vidaPersonaje.modificarVida()
	}
	
	method perderVelocidad(cantidad){
		reduccionDeVelocidad += cantidad
	}
	
	method ganarPuntos(cantidad){
		puntos += cantidad
	}
	
	method perderPuntos(cantidad){
		puntos = 0.max(puntos - cantidad)
	}
}