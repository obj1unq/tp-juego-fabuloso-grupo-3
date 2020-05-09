object normal{ // si el proyectil está en este estado devuelve sus propios atributos (hace daño y tiene una imagen propia)
	method imagen(objeto){
		return objeto.imagen()
	}
	method danio(objeto){
		return objeto.danioNormal()
	}
}

object cayendo{ // si el proyectil está cayendo no hace daño y muestra una imagen que indica adonde va a caer
	method imagen(objeto){
		return "manzana.png" //imagen provisoria
	}
	method danio(objeto){
		return 0
	}

}