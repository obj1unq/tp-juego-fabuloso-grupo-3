import wollok.game.*
import objects.*
object randomizer{
	method emptyPosition(){
		const positionRandom = game.at(
			0.randomUpTo(game.width() - 1).truncate(0)	,
			0.randomUpTo(game.height() - 1).truncate(0)
		)
		
		if( game.getObjectsIn(positionRandom).isEmpty()) {
				return positionRandom
		} else{
			return self.emptyPosition()
		}
	}
	
	method emptyOrPj(){
				const positionRandom = game.at(
			0.randomUpTo(game.width() - 1).truncate(0)	,
			0.randomUpTo(game.height() - 1).truncate(0)
		)
		
		if( game.getObjectsIn(positionRandom).isEmpty() or game.getObjectsIn(positionRandom).contains(personaje)) {
				return positionRandom
		} else{
			return self.emptyOrPj()
		}
	}
	
}
