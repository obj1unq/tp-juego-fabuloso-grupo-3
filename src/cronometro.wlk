import wollok.game.*
import objects.*

object cronometro {
	var minutos = 00
	var segundos = 00
	
	method sumar() {
		if (personaje.vida() > 0) {
			if (segundos == 59) { 
				segundos = 0
				minutos += 1
			}
			else { 
				segundos += 1
			}
			console.println(minutos.toString() +
							":" + 
							segundos.toString())
		}
		else { 
			console.println("Perdiste, has vivido: " + minutos + ":" + segundos)
		}
	}
}