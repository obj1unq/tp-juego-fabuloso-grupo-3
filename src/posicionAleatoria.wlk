import wollok.game.*
import personaje.*

object randomizer{
	method emptyPosition(){
		const positionRandom = game.at(
			0.randomUpTo(game.width() - 1).truncate(0),
			0.randomUpTo(game.height() - 1).truncate(0))
		
		if(game.getObjectsIn(positionRandom).isEmpty()) {
			return positionRandom
		} 
		else {
			return self.emptyPosition()
		}
	}
	
	// Este metodo devuelve una posicion aleatoria que
	//   puede ser vacía o la del personaje.
	method emptyOrPj(){ 
		const positionRandom = game.at(
			0.randomUpTo(game.width() - 1).truncate(0),
			0.randomUpTo(game.height() - 1).truncate(0))
		
		if(game.getObjectsIn(positionRandom).isEmpty() or
		   (game.getObjectsIn(positionRandom).contains(personaje) and game.getObjectsIn(positionRandom).size() == 1)) {
			return positionRandom
		} 
		else {
			return self.emptyOrPj()
		}
	}	
}

object celda {
	method vaciaOElPersonaje(coordenada) {
		return(game.getObjectsIn(coordenada).isEmpty() or	(game.getObjectsIn(coordenada).contains(personaje) and game.getObjectsIn(coordenada).size() == 1))
	}
	
}
