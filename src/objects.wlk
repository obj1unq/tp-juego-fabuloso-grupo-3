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

object randomizer{
	method emptyPosition(){
		const positionRandom = game.at(
			0.randomUpTo(game.width() - 1).truncate(0)	,
			0.randomUpTo(game.height() - 1).truncate(0)
		)
		
		if( game.getObjectsIn(positionRandom).isEmpty()) {
				return positionRandom
		} else{
			return self.emptyPosition()
		}
	}
	
}





object proyectil{
	var property imagen ="alpiste.png"
	var property position = game.at(3,3)
	var property estado = cayendo
	const property danioNormal = 20
	
	method image(){
		estado.imagen(self)
	}
	
	
	method caer(){
		self.position(randomizer.emptyPosition())
	}
	
	method colisionoCon(pj){
		pj.perderVida(estado.danio())
		console.println(personaje.vida())
	}
	
}

object cayendo{
	method imagen(objeto){
		return "fondo.png"
	}
	method danio(objeto){
		return 0
	}
}

object normal{
	method imagen(objeto){
		return objeto.imagen()
	}
	method danio(objeto){
		return objeto.danioNormal()
	}
}
