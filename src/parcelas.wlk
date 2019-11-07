import semillas.*
class Parcelas{
	var property ancho = 0
	var property largo = 0
	var property plantas = #{}
	var property horasDeSol = 0
	method seAsociaBien(planta)
	method parcelas() = plantas
	method superficie() = ancho * largo
	method maxCant(){
		if (ancho > largo){
			return self.superficie()/5
		}
		else{
			return self.superficie()/3 + largo
		}
	}
	method tieneComplicaciones(){
		return plantas.any({planta => planta.horasDeSolQueTolera() < self.horasDeSol()})
	}
	method plantarUnaPlanta(planta){
		if(self.plantasPlantadas() <= self.maxCant() or planta.horasDeSolQueTolera() < (self.horasDeSol()-2)){
			plantas.add(planta)
		}
		else{
			self.error("Error al cargar la planta")
		}
	}
	method cantDePlantasBienAsociadas() = plantas.map({planta => planta.parcelaIdeal(self)}).size()
	method porcentajeDePlantaBienAsociadas() = (self.cantDePlantasBienAsociadas()*100).div(plantas.size())
	method esAutoSustentable() = self.plantasPlantadas() >= 4
	method plantasPlantadas() = plantas.size()
	method alturaMax() = plantas.max({planta => planta.altura()}).altura()
}
class ParcelasEcologicas inherits Parcelas{
	override method seAsociaBien(planta) = not self.tieneComplicaciones() and planta.parcelaIdeal()
}
class ParcelasIndustriales inherits Parcelas{
	override method seAsociaBien(planta) = self.maxCant() == 2 and planta.esFuerte()
}