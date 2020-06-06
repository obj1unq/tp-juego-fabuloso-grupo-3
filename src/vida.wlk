import wollok.game.*
import personaje.*


object vida {
	
	method mostrarVida(){
		corazonIzquierdo.poner()
		corazonDerecho.poner()
	}
	method modificarVida(){
		if (personaje.vida().between(0,20)){
			corazonIzquierdo.image("corazonVacio.png")
			corazonDerecho.image("corazonVacio.png")
		}
		if (personaje.vida().between(21, 40)){
			corazonIzquierdo.image("medioCorazon.png")
			corazonDerecho.image("corazonVacio.png")
		} 
		if (personaje.vida().between(41, 60)){
			corazonIzquierdo.image("corazonCompleto.png")
			corazonDerecho.image("corazonVacio.png")
		}
		if (personaje.vida().between(61, 80)){
			corazonIzquierdo.image("corazonCompleto.png")
			corazonDerecho.image("medioCorazon.png")
		}
		if (personaje.vida().between(81, 100)){
			corazonIzquierdo.image("corazonCompleto.png")
			corazonDerecho.image("corazonCompleto.png")
		}
	}
}
class Corazon {
	var property position = game.at(0,0)
	var property image = "corazonCompleto.png"
	
	method poner() {
		position = game.at(self.columna(), game.height() - 1)
		game.addVisual(self)
	}
	method modificarCorazon(){
		
	} 
	method columna()
	
}

object corazonIzquierdo inherits Corazon {
	override method columna() = 0
	
}
object corazonDerecho inherits Corazon {
	override method columna() = 1
}
