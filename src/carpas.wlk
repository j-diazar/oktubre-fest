import marcasyjarras.*
import personas.*

class Carpa{
	var property limiteGente = 0
	var property bandaTradicional = false
	var property marcaCerveza
	const property personasAdentro = []
	
	method personasAdentroPar(){
		return personasAdentro.size().even()
	}
	
	method dejaEntrar(persona){
		return personasAdentro.size() + 1 <= limiteGente and
		not persona.estaEbria() 
	}
	
	method puedeEntrar(persona){
		return persona.quiereEntrar(self) and self.dejaEntrar(persona)
	}
	
	method entrar(persona){
		if (self.puedeEntrar(persona)){
			personasAdentro.add(persona)
		} else { self.error("La persona no puede entrar.") }
	}
	
	method servirJarraA(persona, capacidadPedida){
		const jarraAServir = new Jarra(marca=marcaCerveza,capacidad=capacidadPedida)
		
		if (personasAdentro.contains(persona)){persona.comprar(jarraAServir)
		} else { self.error("La persona no esta en la carpa.") }
	}
	
	method cantidadEbriosEmpedernidos(){
		return personasAdentro.count({p => p.ebrioEmpedernido()})
	}
	
	//Avanzados - es homogenea
	method esHomogenea(){
		const nacionalidadPersonas = personasAdentro.map({p => p.nacionalidad()}).asSet()
		
		return nacionalidadPersonas.size() == 1
	}
	
}