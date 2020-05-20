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
