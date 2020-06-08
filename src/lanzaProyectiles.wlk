import cosasQueCaen.*
import wollok.game.*


object lanzaPiedras {
	const proyectilesActuales = [new Piedra()]
	
	method iniciar(){
		game.onTick(3037, "lanzaProyectilesActivado", {self.lanzarTodo()})
		game.onTick(20000, "agregarProyectiles", {self.agregarProyectil()})
	}
	
	method lanzarTodo(){
		proyectilesActuales.forEach({proyectil => proyectil.caer()})
	}	
	
	method agregarProyectil(){
		proyectilesActuales.add(new Piedra())
	}
}

object lanzaBombas{
	const bombasActuales = #{new Bomba()}
	
	method inicio(){
		game.onTick(8429, "lanzaBombasActivado", {self.lanzarTodo()})
		game.onTick(50000, "agregarBombas", {self.agregarBomba()})
	}
	
	method lanzarTodo(){
		bombasActuales.forEach({proyectil => proyectil.caer()})
	}
	
	method agregarBomba(){
		bombasActuales.add(new Bomba())
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
}

