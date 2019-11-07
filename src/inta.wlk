object inta {
	var property colParcelas = #{}
	method promedioDePlantas() = colParcelas.sum({parc => parc.plantasPlantadas()}).div(colParcelas.size())
	method laMasAutosustentable(){
		colParcelas.filter({parc => parc.esAutoSustentable()}).max({parc => parc.porcentajeDePlantaBienAsociadas()})
	}
}
