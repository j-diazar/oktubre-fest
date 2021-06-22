class MarcaCerveza {
	var property lupulo = 0
	var property pais 
	var property graduacion = 0
}

class MarcaRubia inherits MarcaCerveza{
}

class MarcaNegra inherits MarcaCerveza{
	var property graduacionReglamentaria = 0
	
	override method graduacion(){
		return graduacionReglamentaria.min(lupulo*2)
	}
}

class MarcaRoja inherits MarcaCerveza{
	var property graduacionReglamentaria = 0
	
	override method graduacion(){
		return (graduacionReglamentaria.min(lupulo*2))*1.25
	}
}

class Jarra {
	var property capacidad = 0
	var property marca
	
	method contenidoDeAlcohol(){
		return capacidad * marca.graduacion()
	}
	
	method pais(){
		return marca.pais()
	}
}



