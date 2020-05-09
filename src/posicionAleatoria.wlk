import wollok.game.*

object posicionAleatoria {
	
	method posicionVaciaX(){
	const posicionAleatoria = game.at(
		0.randomUpTo(game.width() - 1).truncate(0) ,
		0.randomUpTo(game.height() - 1).truncate(0)
	)
		if (game.getObjectsIn(posicionAleatoria).isEmpty()) {
			return 0.randomUpTo(game.width() - 1).truncate(0)
		}	
		else {
			return self.posicionVaciaX()
		}
	}
	method posicionVaciaY(){
		const posicionAleatoria = game.at(
		0.randomUpTo(game.width() - 1).truncate(0) ,
		0.randomUpTo(game.height() - 1).truncate(0)
	)
		if (game.getObjectsIn(posicionAleatoria).isEmpty()) {
			return 0.randomUpTo(game.width() - 1).truncate(0)
		}	
		else {
			return self.posicionVaciaY()
		}
	}
}
