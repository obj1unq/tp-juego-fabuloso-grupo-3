object normal { 
	// Si el proyectil está en este estado devuelve sus propios
	// atributos (hace daño y tiene una imagen propia).
	
	method imagen(){
		return "link.jpg"
	}
	
	method danio(objeto){
		return objeto.danioNormal()
	}
}

object cayendo { 
	// Si el proyectil está cayendo no hace daño y muestra
	// una imagen que indica donde va a caer.
	
	method imagen() {
		return "manzana.png" // imagen provisoria
	}
	
	method danio(objeto) {
		return 0
	}
}