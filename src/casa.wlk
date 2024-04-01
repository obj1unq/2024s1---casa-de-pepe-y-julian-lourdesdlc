object casaDePepeYJulian {

	var porcentajeViveres = 50
	var montoDeReparacion
	var cuenta
	var estrategiaDeAhorro
	
	method hacerReparaciones(){
		cuenta.extraer(montoDeReparacion)
		montoDeReparacion = 0
	}
	method alcazaParaReparacionesDe(monto, resto){
		return cuenta.saldo() - monto > resto 
	}
	method comprarViveres(porcentaje, calidad){
		cuenta.extraer(porcentaje * calidad)
		porcentajeViveres += porcentaje
	}
	method cuenta(_cuenta){
		cuenta = _cuenta
	}
	method cuenta(){
		return cuenta
	}
	method estrategiaDeAhorro(_estrategiaDeAhorro){
		estrategiaDeAhorro = _estrategiaDeAhorro
	}
	method montoDeReparacion(){
		return montoDeReparacion
	}
	method montoDeReparacion(_montoDeReparacion){
		montoDeReparacion = _montoDeReparacion
	}
	method agregarReparacion(monto){
		montoDeReparacion += monto
	}
	method porcentajeViveres(){
		return porcentajeViveres
	}
	method porcentajeViveres(_porcentajeViveres){
		porcentajeViveres = _porcentajeViveres
	}
	method tieneViveresSuficientes(){
		return porcentajeViveres > 40
	}
	method hayQueHacerReparaciones(){
		return montoDeReparacion > 0
	}
	method romper(costoDeReparacion){
		montoDeReparacion = costoDeReparacion
	}
	method estaEnOrden(){
		return not self.hayQueHacerReparaciones() 
			and self.tieneViveresSuficientes()
	}
}

object minimoEIndispensable {
	var property calidad = 0
	
	method mantener(casa){
		if(not casa.tieneViveresSuficientes()){
			casa.comprarViveres(40 - casa.porcentajeViveres(), calidad)
		}
	}
}

object full {
	const calidad = 5
	
	method mantener(casa){
		const porcentajeViveres = if (casa.estaEnOrden()){
			100 - casa.porcentajeViveres()
		}else{
			40
		}
		casa.comprarViveres(porcentajeViveres, calidad)
		
		if(casa.alcazaParaReparacionesDe(casa.montoDeReparacion(), 1000)){
			casa.hacerReparaciones()
		}
	}
}
object cuentaCorriente {
	var property saldo = 0
	
	method depositar(cantidad){
		saldo += cantidad
	}
	method extraer(cantidad){
		saldo -= cantidad
	}
}
object cuentaConGastos {
	var saldo = 0
	var costoPorOperacion = 0
	
	method saldo(){
		return saldo
	}
	method saldo(_saldo){
		saldo = _saldo
	}
	method costoPorOperacion(){
		return costoPorOperacion
	}
	method costoPorOperacion(_costoPorOperacion){
		costoPorOperacion = _costoPorOperacion
	}
	method depositar(cantidad){
		saldo = saldo + cantidad - costoPorOperacion
	}
	method extraer(cantidad){
		saldo -= cantidad
	}
}

object cuentaCombinada {
	var primaria
	var secundaria
	
	method saldo(){
		return primaria.saldo() + secundaria.saldo()
	}
	method primaria(_primaria){
		primaria = _primaria
	}
	method secundaria(_secundaria){
		secundaria = _secundaria
	}
	method depositar(importe){
		 primaria.depositar(importe)
	}
	method extraer(cantidad) {
		if (primaria.saldo() >= cantidad) {
			primaria.extraer(cantidad)
		} else {
			secundaria.extraer(cantidad)
		}
	}
}
/*
 * Es posible agregar nuevas casas que usen ambas estrategias(full y minimoEIndispensable)
 * deberian entender los mismos mensajes que casaDePepeYJulian.
 */