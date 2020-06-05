import wollok.game.*
import personaje.*
import posicionAleatoria.*
import estados.*
import explosion.*

//PROYECTIL BASE
class Proyectil {
	var property imagen = "piedra.png"
	var property estado = cayendo // Esto determina si el objeto hace daño o no, y que imagen tiene por polimorfismo
	var property position = randomizer.emptyOrPj()
	const property danioNormal = 20
	
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

class Bomba{
	var property image = "bomba.png"
	var property position = randomizer.emptyOrPj()
	const property explosion = new Explosion(posicionCentral = position)
	
	method caer(){
		position = randomizer.emptyOrPj()
		game.addVisual(self)
		game.schedule(1013,{self.explotar()})
	}
	
	method explotar(){
		explosion.posicionCentral(position)
		game.removeVisual(self)
		explosion.aparecer()
	}
	
	method colisionoCon(pj){
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