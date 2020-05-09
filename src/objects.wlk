import wollok.game.*
import posicionAleatoria.*

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
	const property imagen ="alpiste.png"
	var property position = game.at(0, 9)
	var property estado = cayendo
	const property danioNormal = 20
	
	method image(){
		return estado.imagen(self)
	}
	
	method caer(){
		self.position(randomizer.emptyOrPj())
		self.estado(cayendo)
		game.schedule(1000,{self.impacto()})
	}
	
	method impacto(){
		estado = normal
		
		if(game.getObjectsIn(position).contains(personaje)){
			self.colisionoCon(personaje)
		}
	}
	
	method colisionoCon(pj){
		pj.perderVida(estado.danio(self))
		console.println(pj.vida())
	}
	
}

object cayendo{
	method imagen(objeto){
		return "manzana.png"
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
