import wollok.game.*

object explosion{
	method aparecer(posicion){
		fuego1.aparecer(posicion)
		fuego2.aparecer(posicion.right(1))
		fuego3.aparecer(posicion.left(1))
		fuego4.aparecer(posicion.up(1))
		fuego5.aparecer(posicion.down(1))
	}
}

object fuego1{
	const property image = "fueguito.png"
	method aparecer(posicion){
		game.addVisualIn(self, posicion)
		game.schedule(2000,{game.removeVisual(self)})
	}
	
	method colisionoCon(pj){
		pj.perderVida(30)
		console.println(pj.vida())
	}
}

object fuego2{
	const property image = "fueguito.png"
	method aparecer(posicion){
		game.addVisualIn(self, posicion)
		game.schedule(2000,{game.removeVisual(self)})
	}
	
	method colisionoCon(pj){
		pj.perderVida(30)
		console.println(pj.vida())
	}
}
object fuego3{
	const property image = "fueguito.png"
	method aparecer(posicion){
		game.addVisualIn(self, posicion)
		game.schedule(2000,{game.removeVisual(self)})
	}
	
	method colisionoCon(pj){
		pj.perderVida(30)
		console.println(pj.vida())
	}
}
object fuego4{
	const property image = "fueguito.png"
	method aparecer(posicion){
		game.addVisualIn(self, posicion)
		game.schedule(2000,{game.removeVisual(self)})
	}
	
	method colisionoCon(pj){
		pj.perderVida(30)
		console.println(pj.vida())
	}
}
object fuego5{
	const property image = "fueguito.png"
	method aparecer(posicion){
		game.addVisualIn(self, posicion)
		game.schedule(2000,{game.removeVisual(self)})
	}
	
	method colisionoCon(pj){
		pj.perderVida(30)
		console.println(pj.vida())
	}
}