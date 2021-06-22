import marcasyjarras.*
import carpas.*

class Persona{
	var property peso = 0
	const property jarrasCompradas = []
	var property escuchaTradicional = false
	var property nivelDeAguante = 0
	var property nacionalidad = ""
	const property marcasPreferidas = []

	method totalAlcohol(){
		return jarrasCompradas.sum({j => j.contenidoDeAlcohol()})
	}
	
	method estaEbria(){
		return (self.totalAlcohol() * peso) > nivelDeAguante
	}
	
	method comprar(jarra){
		jarrasCompradas.add(jarra)
	}
	
	method leGusta(marca){
		//const marcasPreferidas = []
		
		return marcasPreferidas.contains(marca)
	}
	
	method agregarMarcaPreferida(marca){
		marcasPreferidas.add(marca)
	}
	
	method quiereEntrar(carpa){
		return self.leGusta(carpa.marcaCerveza()) and 
		carpa.bandaTradicional() == self.escuchaTradicional()
	}
	
	method ebrioEmpedernido(){
		return jarrasCompradas.all({j=> j.capacidad() >= 1 })
	}
	
	method esPatriota(){
		return jarrasCompradas.all({j=> j.pais() == nacionalidad})
	}
	
	//AVANZADOS - son compatibles
	method marcasJarrasCompradas(){
		return jarrasCompradas.map({j=> j.marca()}).asSet()
	}
	
	method esCompatibleCon(persona){
		return self.marcasCoincidencia(persona).count() > 
		self.marcasDiferencia(persona).count()
		
	}
	
	method marcasCoincidencia(persona){
		return self.marcasJarrasCompradas().intersection(persona.marcasJarrasCompradas())
	}
	
	method marcasDiferencia(persona){
		return self.marcasJarrasCompradas().difference(persona.marcasJarrasCompradas())
	}
	
}

class Belga inherits Persona{
	// No setea el valor de nacionalidad :( 
	/* constructor (_peso, _escuchaTradicional, _nivelDeAguante){
		peso = _peso
		escuchaTradicional = _escuchaTradicional
		nivelDeAguante = _nivelDeAguante 
		nacionalidad = "Belgica"
	}*/

	override method nacionalidad(){
		nacionalidad = "Belgica"
	} 
	
	override method leGusta(marca){
		 return marca.lupulo() > 4
	}
}

class Checo inherits Persona{
	
	override method nacionalidad(){
		nacionalidad = "Republica Checa"
	}
	
	override method leGusta(marca){
		 return marca.graduacion() > 0.08
	}
}

class Aleman inherits Persona{
	
	override method nacionalidad(){
		nacionalidad = "Alemania"
	} 
	
	override method leGusta(marca){
		 return true
	}
	
	override method quiereEntrar(carpa){
		return super(carpa) and carpa.personasAdentroPar()
	}
}