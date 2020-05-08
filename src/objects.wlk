import wollok.game.*

object personaje {
	var property image ="link.jpg"
	var property position = game.at(0,0)
	
	var vida = 100
	var reduccionDeVelocidad = 0
	
	method perderVida(cantidad){
		vida = (vida - cantidad).max(0)
	}
	
	method ganarVida(cantidad){
		vida =(vida + cantidad).min(100)
	}
	method perderVelocidad(cantidad){
		reduccionDeVelocidad += cantidad
	}
	
	//method colisionoCon(objeto){
	//}
}
