import cosasQueCaen.*
import wollok.game.*
import dificultades.*


object lanzaPiedras {
	//dificultadActual.tiempoDeLanzamientoPiedraMovediza()
	method lanzar(){
		const piedra = new Piedra()
		piedra.caer()
	}
}

object lanzaBolasDePinchos{
	const property proyectilesActuales = [new BolaDePinchos()]
	
	method iniciar(){
		game.onTick(dificultad.tiempoDeLanzamientoBolasDePinchos(), "lanzaProyectilesActivado", {self.lanzarTodo()})
		game.onTick(dificultad.tiempoDeCargaBolasDePinchos(), "agregarProyectiles", {self.agregarProyectil()})
	}
	
	method lanzarTodo(){
		proyectilesActuales.forEach({proyectil => proyectil.caer()})
	}	
	
	method agregarProyectil(){
		proyectilesActuales.add(new BolaDePinchos())
	}
	
	method mapeoProyectiles(){
		return proyectilesActuales.map({proyectil => proyectil.position()})
	}
}

object lanzaBombas{
	const property bombasActuales = #{new Bomba()}
	
	method inicio(){
		game.onTick(dificultad.tiempoDeLanzamientoBombas(), "lanzaBombasActivado", {self.lanzarTodo()})
		game.onTick(dificultad.tiempoDeCargaBombas(), "agregarBombas", {self.agregarBomba()})
	}
	
	method lanzarTodo(){
		bombasActuales.forEach({proyectil => proyectil.caer()})
	}
	
	method agregarBomba(){
		bombasActuales.add(new Bomba())
	}
	
	method mapeoProyectiles(){
		return bombasActuales.map({proyectil => proyectil.position()})
	}
}

object controladorMonedas{
	var property monedasActuales=[new Moneda(), new Moneda(), new Moneda(), new Moneda(), new Moneda()]
	
	method inicio(){
		game.onTick(10000,"apareceMoneda", {self.aparecenTodas()})
		game.onTick(35000,"menosMonedas", {self.quitarMoneda()})
	}
	
	method aparecenTodas(){
		monedasActuales.forEach({moneda => moneda.aparicion()})
	}
	
	method quitarMoneda(){
		if(monedasActuales.size() > 1){
			monedasActuales.remove(monedasActuales.head())
		}
	}
	
	method mapeoMonedas(){
		return monedasActuales.map({moneda => moneda.position()})
	}
}

