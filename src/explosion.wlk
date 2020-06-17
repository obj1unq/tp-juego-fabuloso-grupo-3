import wollok.game.*
import personaje.*
import vida.*
import posicionAleatoria.*

class Explosion{
	var property posicionCentral = game.at(5,5)
	const fuego1 = new Fuego(position = posicionCentral)
	const fuego2 = new Fuego(position =posicionCentral.right(1))
	const fuego3 = new Fuego(position =posicionCentral.left(1))
	const fuego4 = new Fuego(position =posicionCentral.down(1))
	const fuego5 = new Fuego(position =posicionCentral.up(1))
	const todosLosFuegos = #{fuego1,fuego2,fuego3,fuego4,fuego5}
	
	method aparecer(){
		self.setearPosicionesFuego()
		todosLosFuegos.forEach({fuego => fuego.aparecer()})
	}
	
	method setearPosicionesFuego(){
		fuego1.position(posicionCentral) 
		fuego2.position(posicionCentral.right(1))
		fuego3.position(posicionCentral.left(1))
		fuego4.position(posicionCentral.up(1))
		fuego5.position(posicionCentral.down(1))	
	}
}

class SuperExplosion inherits Explosion{
	const fuego6 = new Fuego(position =posicionCentral.right(2))
	const fuego7 = new Fuego(position =posicionCentral.left(2))
	const fuego8 = new Fuego(position =posicionCentral.down(2))
	const fuego9 = new Fuego(position =posicionCentral.up(2))
	const nuevosFuegos = #{fuego6,fuego7,fuego8,fuego9}
	
	override method aparecer(){
		super()
		nuevosFuegos.forEach({fuego => fuego.aparecer()})
		
	}
	
	override method setearPosicionesFuego(){
		super()
		fuego6.position(posicionCentral.right(2))
		fuego7.position(posicionCentral.left(2))
		fuego8.position(posicionCentral.up(2))
		fuego9.position(posicionCentral.down(2))
	}
}


class Fuego{
	const property image = "fueguito.png"
	var property position // hay que darle una posicion al instanciarlo
	method aparecer(){
		if(celda.vaciaOElPersonaje(position)){
			game.addVisual(self)
			game.schedule(2000,{game.removeVisual(self)})
		}
	}

method colisionoCon(pj){
		pj.perderVida(30)
	}
}
