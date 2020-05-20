import wollok.game.*
import personaje.*
import posicionAleatoria.*
import estados.*
import explosion.*

//PROYECTIL BASE
class Proyectil {
	var property imagen = "piedra.png"
	
	// No es importante donde inicia, ya que se va a randomizar
	// su posicion en el corto plazo
	var property position = randomizer.emptyOrPj()
	 
	// Esto determina si el objeto hace daño o no, y que imagen tiene por polimorfismo
	var property estado = cayendo
	
	const property danioNormal = 20
	
	method image(){
		return estado.imagen(self)
	}
	
	method caer() { 
		// Todos los objetos que dañen al personaje deberian entender
		// este msj y tener una aplicacion parecida
		
		self.estado(cayendo)
		self.position(randomizer.emptyOrPj())
		game.addVisual(self)
		game.schedule(1000, { self.impacto() })
	}
	
	method impacto() {
		
		self.estado(normal)
		// Chequea si el personaje está en la misma celda cuando hay cambio de estado
		if(game.getObjectsIn(position).contains(personaje)) {
			self.colisionoCon(personaje)
		}
		game.schedule(1000,{game.removeVisual(self)})
	}
	
	method colisionoCon(pj) {
		pj.perderVida(estado.danio(self))
		console.println(pj.vida())
	}
	
}

object botiquin {
	var property image = "botiquin.png"
	var property position = randomizer.emptyPosition()
	
	method aparicion(){
		position = randomizer.emptyPosition()
		if(not game.hasVisual(self)){
			game.addVisual(self)
		}
	}
	
	method colisionoCon(pj){
		pj.ganarVida(30)
		console.println(pj.vida())
		game.removeVisual(self)
	}
}

object bomba {
	var property image = "bomba.png"
	var property position = randomizer.emptyOrPj()
	
	method caer(){
		position = randomizer.emptyOrPj()
		game.addVisual(self)
		game.schedule(1000,{self.explotar()})
	}
	
	method explotar(){
		game.removeVisual(self)
		explosion.aparecer(position)
	}
	
	method colisionoCon(pj){
	}
}

object moneda{
	const property image= "moneda.png"
	var property position = randomizer.emptyPosition()
	
	method aparicion(){
		position = randomizer.emptyPosition()
		if(not game.hasVisual(self)){
			game.addVisual(self)
		}
	}
	
	method colisionoCon(pj){
		//acá va un metodo para sumar puntos!!!!
		game.removeVisual(self)
	}
}

