import wollok.game.*
import objects.*
import posicionAleatoria.*
import objects.*
import estados.*

//PROYECTIL BASE

object proyectil{
	const property imagen ="alpiste.png" // esta imagen es la que va a tener cuando pueda hacer daño
	var property position = game.at(0, 9)
	var property estado = cayendo // esto determina si el objeto hace daño o no y que imagen tiene por polimorfismo
	const property danioNormal = 20
	
	method image(){
		return estado.imagen(self)
	}
	
	method caer(){ // todos los objetos que dañen al personaje deberian entender este msj y tener una aplicacion parecida
		self.position(randomizer.emptyOrPj())
		self.estado(cayendo)
		game.schedule(1000,{self.impacto()})
	}
	
	method impacto(){
		estado = normal
		
		if(game.getObjectsIn(position).contains(personaje)){ //chequea si el personaje está en la misma celda cuando hay cambio de estado
			self.colisionoCon(personaje)
		}
	}
	
	method colisionoCon(pj){
		pj.perderVida(estado.danio(self))
		console.println(pj.vida())
	}
	
}

// Hasta acá



object proyectil2 {
	var property image ="alpiste.png"
	var property position = randomizer.emptyOrPj()
	
	method colisionoCon(pj){
		pj.perderVida(20)
		console.println(personaje.vida())
	}
	
}
object bomba {
	var property image = "alpiste.png"
	var property position = randomizer.emptyOrPj()
	
	method colisionoCon(pj){
		pj.perderVida(50)
		console.println(personaje.vida())
	}
}
object botiquin {
	var property image = "alpiste.png"
	var property position = randomizer.emptyPosition()

	method colisionoCon(pj){
		pj.ganarVida(100)
		console.println(personaje.vida())
	}
}
