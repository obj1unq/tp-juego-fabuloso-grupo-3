import wollok.game.*
import personaje.*
import vida.*

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


class Fuego{
	const property image = "fueguito.png"
	var property position // hay que darle una posicion al instanciarlo
	method aparecer(){
		if(game.getObjectsIn(position).isEmpty() or	(game.getObjectsIn(position).contains(personaje) and game.getObjectsIn(position).size() == 1)){
			game.addVisual(self)
			game.schedule(2000,{game.removeVisual(self)})
		}
	}

	
method colisionoCon(pj){
		pj.perderVida(30)
		vida.modificarVida()
	}
}
