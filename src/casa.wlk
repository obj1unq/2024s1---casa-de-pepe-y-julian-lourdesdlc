object casaDePepeYJulian {

	var cantViveres = 50
	var monto
	
	method cantViveres() {
		return cantViveres
	}
	method cantViveres(_cantViveres) {
		cantViveres = _cantViveres
	}
	method monto() {
		return monto
	}

	method tieneViveresSuficientes() {
		return cantViveres > 40
	}

	method hayQueHacerReparaciones() {
		return monto > 0
	}
	method romper(costoDeReparacion) {
		monto = costoDeReparacion
	}
	method estaEnOrden() {
		return not self.hayQueHacerReparaciones() 
			and self.tieneViveresSuficientes()
	}
}

