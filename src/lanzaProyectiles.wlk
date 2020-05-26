import cosasQueCaen.*
import wollok.game.*

object lanzaProyectiles {
	const proyectilesActuales = [new Proyectil()]
	
	method iniciar(){
		game.onTick(3000, "lanzaProyectilesActivado", {self.lanzarTodo()})
		game.onTick(20000, "agregarProyectiles", {self.agregarProyectil()})
	}
	
	method lanzarTodo(){
		proyectilesActuales.forEach({proyectil => proyectil.caer()})
	}	
	
	method agregarProyectil(){
		proyectilesActuales.add(new Proyectil())
	}
}

object controladorMonedas{
	const monedasActuales=#{new Moneda(), new Moneda(), new Moneda(), new Moneda(), new Moneda()}
	
	method inicio(){
		game.onTick(10000,"apareceMoneda", {self.aparecenTodas()})
		game.onTick(40000,"menosMonedas", {self.quitarMoneda()})
	}
	
	method aparecenTodas(){
		monedasActuales.forEach({moneda => moneda.aparicion()})
	}
	
	method quitarMoneda(){
		if(monedasActuales.size() > 1){
		monedasActuales.remove(monedasActuales.anyOne())
		}
	}
}

