object normal { 
	// Si el proyectil está en este estado devuelve sus propios
	// atributos (hace daño y tiene una imagen propia).
	
	method imagen(objeto){
		return objeto.imagen() // devuelve la imagen base del objeto
	}
	
	method danio(objeto){
		return objeto.danioNormal()
	}
}

object cayendo { 
	// Si el proyectil está cayendo no hace daño y muestra
	// una imagen que indica donde va a caer.
	
	method imagen(objeto) {
		return "sombra-png-4.png" // imagen provisoria que simula la caida
	}
	
	method danio(objeto) {
		return 0
	}
}