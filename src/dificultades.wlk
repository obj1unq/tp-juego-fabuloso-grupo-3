object dificultad {
	var property dificultadActual = dificil
	
	method tiempoDeLanzamientoBombas(){
		return dificultadActual.tiempoDeLanzamientoBombas()
	}
	
	method tiempoDeLanzamientoPiedrasEstaticas(){
		return dificultadActual.tiempoDeLanzamientoPiedrasEstaticas()
	}
	
	method tiempoDeLanzamientoBolasDePinchos(){
		return dificultadActual.tiempoDeLanzamientoBolasDePinchos()
	}
	
	method tiempoDeLanzamientoPiedraMovediza(){
		return dificultadActual.tiempoDeLanzamientoPiedraMovediza()
	}
	
	method tiempoDeLanzamientoSuperBomba(){
		return dificultadActual.tiempoDeLanzamientoSuperBomba()
	}
	
	method tiempoDeCargaBolasDePinchos(){
		return dificultadActual.tiempoDeCargaBolasDePinchos()
	}
	
	method tiempoDeCargaBombas(){
		return dificultadActual.tiempoDeCargaBombas()
	}
}

object facil{
	method tiempoDeLanzamientoBombas(){
		return 15000
	}
	
	method tiempoDeLanzamientoPiedrasEstaticas(){
		return 60000
	}
	
	method tiempoDeLanzamientoBolasDePinchos(){
		return 10000
	}
	
	method tiempoDeLanzamientoPiedraMovediza(){
		return 12000
	}
	
	method tiempoDeLanzamientoSuperBomba(){
		return 30000
	}
	
	method tiempoDeCargaBolasDePinchos(){
		return 30000
	}
	
	method tiempoDeCargaBombas(){
		return 40000
	}
}

object normal{
	method tiempoDeLanzamientoBombas(){
		return 10000
	}
	
	method tiempoDeLanzamientoPiedrasEstaticas(){
		return 40000
	}
	
	method tiempoDeLanzamientoBolasDePinchos(){
		return 7500
	}
	
	method tiempoDeLanzamientoPiedraMovediza(){
		return 8000
	}
	
	method tiempoDeLanzamientoSuperBomba(){
		return 20000
	}
	
	method tiempoDeCargaBolasDePinchos(){
		return 20000
	}
	
	method tiempoDeCargaBombas(){
		return 25000
	}
}

object dificil{
	method tiempoDeLanzamientoBombas(){
		return 7500
	}
	
	method tiempoDeLanzamientoPiedrasEstaticas(){
		return 20000
	}
	
	method tiempoDeLanzamientoBolasDePinchos(){
		return 3000
	}
	
	method tiempoDeLanzamientoPiedraMovediza(){
		return 5000
	}
	
	method tiempoDeLanzamientoSuperBomba(){
		return 15000
	}
	
	method tiempoDeCargaBolasDePinchos(){
		return 10000
	}
	
	method tiempoDeCargaBombas(){
		return 15000
	}
}