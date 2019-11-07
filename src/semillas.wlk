import parcelas.*
class Planta{
	var property anioObtencion = 0
	var property altura = 0
	method horasDeSolQueTolera()
	method esFuerte(){return self.horasDeSolQueTolera() >= 10}
	method daNuevaSemilla(){return self.esFuerte()}
	method espacioOcupado()
	method parcelaIdeal(parc)
}
class Menta inherits Planta{
	override method horasDeSolQueTolera(){return 6}
	override method daNuevaSemilla(){return super() or altura > 0.4}
	override method espacioOcupado(){return altura * 3}
	override method parcelaIdeal(parc) = parc.superficie() > 6
}
class Soja inherits Planta{
	override method horasDeSolQueTolera(){
		if (altura < 0.5){
			return 6
		}
		else if (altura < 1){
			return 7
		}
		else{
			return 9
		}
		
	}
	override method daNuevaSemilla(){return super() or (altura > 1 and anioObtencion > 2007)}
	override method espacioOcupado(){return altura.div(2)}
	override method parcelaIdeal(parc) = parc.horasDeSol() == self.horasDeSolQueTolera()
}
class Quinoa inherits Planta{
	var property cepa
	override method horasDeSolQueTolera(){
		return cepa.horasDeSol()
	}
	override method daNuevaSemilla(){return super() or anioObtencion < 2005}
	override method espacioOcupado(){return 0.5}
	override method parcelaIdeal(parc) = parc.alturaMax() < 1.5
}
class SojaTransgenica inherits Soja{
	override method daNuevaSemilla() = false
	override method parcelaIdeal(parc) = parc.maxCant() == 1
}
class HierbaBuena inherits Menta{
	override method espacioOcupado(){return super()*2}
}
