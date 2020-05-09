import wollok.game.*
import objects.*
import posicionAleatoria.*

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
