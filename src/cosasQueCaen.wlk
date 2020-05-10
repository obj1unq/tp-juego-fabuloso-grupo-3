import wollok.game.*
import objects.*
import posicionAleatoria.*
import estados.*

//PROYECTIL BASE

object proyectil {
	var property image = "alpiste.png"
	
	// No es importante donde inicia, ya que se va a randomizar
	// su posicion en el corto plazo
	var property position = randomizer.emptyOrPj()
	 
	// Esto determina si el objeto hace daño o no, y que imagen tiene por polimorfismo
	var property estado = cayendo
	
	const property danioNormal = 20
	
	method caer() { 
		// Todos los objetos que dañen al personaje deberian entender
		// este msj y tener una aplicacion parecida
		self.estado(cayendo)
		self.position(randomizer.emptyOrPj())
		self.image(estado.imagen())
		game.schedule(1000, { self.impacto() })
	}
	
	method impacto() {
		self.estado(normal)
		
		// Chequea si el personaje está en la misma celda cuando hay cambio de estado
		if(game.getObjectsIn(position).contains(personaje)) {
			self.colisionoCon(personaje)
		}
	}
	
	method colisionoCon(pj) {
		pj.perderVida(estado.danio(self))
		console.println(pj.vida())
	}
	
}

object proyectil2 {
	var property image = "alpiste.png"
	var property position = randomizer.emptyOrPj()
	
	method colisionoCon(pj){
		pj.perderVida(20)
		console.println(pj.vida())
	}
	
}
object bomba {
	var property image = "alpiste.png"
	var property position = randomizer.emptyOrPj()
	
	method colisionoCon(pj){
		pj.perderVida(50)
		console.println(pj.vida())
	}
}

object botiquin {
	var property image = "alpiste.png"
	var property position = randomizer.emptyPosition()

	method colisionoCon(pj){
		pj.ganarVida(100)
		console.println(pj.vida())
	}
}