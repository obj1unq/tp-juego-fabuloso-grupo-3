import wollok.game.*
import personaje.*
import posicionAleatoria.*
import estados.*
import explosion.*
import vida.*

//PROYECTIL BASE
class Proyectil {
	var property estado = cayendo // Esto determina si el objeto hace daño o no, y que imagen tiene por polimorfismo
	var property position = randomizer.emptyOrPj()
	
	method image(){
		return estado.imagen(self)
	}
	
	method caer() {
		self.comprobarQueNoSeEcuentraEnElJuego() 		
		self.position(randomizer.emptyOrPj())
		self.estado(cayendo)
		game.addVisual(self)
		game.schedule(977, { self.impacto() })
	}
	
	method comprobarQueNoSeEcuentraEnElJuego(){
		if(game.hasVisual(self)){
			game.removeVisual(self)
		}
	}
	
	method impacto() {
		self.comprobarQueNoSeEcuentraEnElJuego()
		self.estado(normal)
		game.addVisual(self)
		game.schedule(500,{game.removeVisual(self)})
	}
	
	method colisionoCon(pj) {
		pj.perderVida(estado.danio(self))
	}
}

class PiedraQueSeMueve inherits Proyectil{
	var property imagen = "piedra.png"
	const property danioNormal = 20
	var property cantidadMovimientos = 0
	
	override method impacto() {
		self.comprobarQueNoSeEcuentraEnElJuego()
		self.estado(normal)
		game.addVisual(self)
		game.schedule(500,{self.moverseHaciaElPersonaje()})		
		cantidadMovimientos = 0
	}
	
	method moverseHaciaElPersonaje() {
		if(cantidadMovimientos == 2) {
			game.removeVisual(self)
		}
		else {
			self.position(self.unoHaciaPersonaje())
			game.schedule(500,{self.moverseHaciaElPersonaje()})
			cantidadMovimientos += 1
		}
	}
	method unoHaciaPersonaje() {
		if(personaje.position().x() > self.position().x() and celda.vaciaOElPersonaje(position.right(1))) {
			return position.right(1)
		}
		else if(personaje.position().x() < self.position().x() and celda.vaciaOElPersonaje(position.left(1))) {
			return position.left(1)
		}
		else if(personaje.position().y() > self.position().y() and celda.vaciaOElPersonaje(position.up(1))) {
			return position.up(1)
		}		
		else if(personaje.position().y() < self.position().y() and celda.vaciaOElPersonaje(position.down(1))) {
			return position.down(1)
		}	
		else {
			return position
		}	
	}
}



class Piedra inherits Proyectil{
	var property imagen = "piedra.png"
	const property danioNormal = 20
	
	override method colisionoCon(pj){
		if (self.estado() == normal){
			pj.perderVida(estado.danio(self))
			pj.irAposicionAnterior()
		}
	}
	override method impacto() {
		self.comprobarQueNoSeEcuentraEnElJuego()
		self.estado(normal)
		game.addVisual(self)
		game.schedule(7500,{game.removeVisual(self)})
	}
}

class BolaDePinchos inherits Proyectil{
	var property image = "bolaDePinchos.png"
	const property danioNormal = 10
	
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


class Bomba inherits Proyectil{
	var property imagen = "bomba.png"
	const property explosion = new Explosion(posicionCentral = position)
	const property danioNormal = 0
	
	override method impacto(){
		self.comprobarQueNoSeEcuentraEnElJuego()
		self.estado(normal)
		game.addVisual(self)
		game.schedule(500,{self.explotar()})
	}
	
	method explotar(){
		explosion.posicionCentral(position)
		game.removeVisual(self)
		explosion.aparecer()
	}
}

class Moneda{
	const property image= "moneda.png"
	var property position = randomizer.emptyPosition()
	const property puntosQueOtorga = 20
	
	method aparicion(){
		position = randomizer.emptyPosition()
		if(not game.hasVisual(self)){
			game.addVisual(self)
		}
	}
	
	method colisionoCon(pj){
		pj.ganarPuntos(puntosQueOtorga)
		game.removeVisual(self)
	}
}

