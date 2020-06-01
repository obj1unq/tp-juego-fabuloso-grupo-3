import wollok.game.*

object guarda{
	var posicionActual = game.at(0,game.height() - 1)
	method ponerGuarda(){
		
		if(not (posicionActual == game.at(game.width() - 1 ,game.height() -1))){
			game.addVisual(new CeldaDeGuarda(position = posicionActual))
			posicionActual = posicionActual.right(1)
			console.println(posicionActual)
			self.ponerGuarda()
		}
		game.addVisual(new CeldaDeGuarda(position = posicionActual))
	}
}

class CeldaDeGuarda{
	const property image = "negro.png"
	var property position
	
	method colisionoCon(pj){
		pj.position(pj.position().down(1))
	}
}
