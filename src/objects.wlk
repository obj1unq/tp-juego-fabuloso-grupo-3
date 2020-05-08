import wollok.game.*

object personaje {
	var property image ="pepita1.png"
	var property position = game.at(0,0)
	
	var property vida = 100
	var property reduccionDeVelocidad = 0
	
	method perderVida(cantidad){
		vida = (vida - cantidad).max(0)
	}
	
	method ganarVida(cantidad){
		vida =(vida + cantidad).min(100)
	}
	method perderVelocidad(cantidad){
		reduccionDeVelocidad += cantidad
	}
}

object proyectil{
	var property image ="alpiste.png"
	var property position = game.at(3,3)
	
	method colisionoCon(pj){
		pj.perderVida(20)
		console.println(personaje.vida())
	}
	
}


