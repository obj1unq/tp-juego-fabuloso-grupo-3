import wollok.game.*

class Explosion{
	var property posicionCentral
	
	method aparecer(){
		const fuegos = #{new Fuego(position = posicionCentral), 
					 new Fuego(position = posicionCentral.right(1)),
					 new Fuego(position = posicionCentral.left(1)),
					 new Fuego(position = posicionCentral.up(1)),
					 new Fuego(position = posicionCentral.down(1))
					 }
		fuegos.forEach({fuego => fuego.aparecer()})
		
	}
}


class Fuego{
	const property image = "fueguito.png"
	
	var property position // hay que darle una posicion al instanciarlo
	method aparecer(){
		game.addVisual(self)
		game.schedule(2000,{game.removeVisual(self)})
	}
	
	method colisionoCon(pj){
		pj.perderVida(30)
		//console.println(pj.vida())
	}
}
