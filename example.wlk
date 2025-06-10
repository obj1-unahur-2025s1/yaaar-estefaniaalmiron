
class BarcoPirata {
  var mision
  const property tripulantes = []
  const capacidad

  method tripulanteTienUnObjeto(unObjeto) {
    return tripulantes.any({ t => t.items().contains(unObjeto)})
  }



  method incorporarPirata(unPirata) = if( capacidad < self.cantidadTripulantes() && mision.esUtil(unPirata) )
                                              tripulantes.add(unPirata)

  method cambiarDeMision(unaNuevaMision) {
    mision = unaNuevaMision
    tripulantes.removeAll(self.tripulantesNoCalifican(nuevaMision))
  }

  method tripulantesNoCalifican(unaMision) = tripulantes.filter({t => !unaMision.esUtil(t)})

  method anclarseEnCiudad(unaCiudad) {
    tripulantes.forEach({t => t.tomarUnTrago()}) // hace las dos consecuencias juntas, tomar y gastar
    tripulantes.forEach({t => t.gastarMonedas()})
    unaCiudad.agregarUnHabitante(self.tripulanteMasEbrio())
    tripulantes.remove(self.tripulanteMasEbrio())
  }

  method tripulanteMasEbrio() = tripulacion.max({p => p.nivelDeEbridad()})

  method esTemible() = mision.puedeCompletarMision(self)

  method cantidadTripulantes = tripulantes.size()
 
  method vulnerable(unBarco) {
    return
    unBarco.cantidadTripulantes() /2 >= self.cantidadTripulantes()
  }

  method saqueadoPor(unPirata) = unPirata.pasadoDeDrog()

  estanTodosPasadosDeGrog() = tripulantes.all({t = t.})

  
}

class Pirata {
  var monedas
  const items = []
  var nivelDeEbriedad

  const quienLoinvito
  
  method esUtilPara(unaMision) { unaMision.}
  method pasadoDeDrog = nivelDeEbriedad >= 90
                      
}

class Mision {
  method puedeCompletarMision(unBarco) = unBarco.tieneSuficienteTripulacion()
}


class BusquedaDelTesoro inherits Mision {

  method tieneItemsDelTesoro(unPirata) {
    return unPirata.items().contains("brujula") || 
           unPirata.items().contains("mapa") || 
           unPirata.items().contains("") 
  } 
  method esUtil(unPirata) {
    self.tieneItemsDelTesoro(unPirata) && unPirata.monedas() <= 5
  }


  override method puedeCompletarMision(unBarco) {
    return super(unBarco)
    unBarco.tripulanteTienunObjeto(unObjeto)
  }
}

class Leyenda inherits Mision {
  const itemObligatorio

  method esUtil(unPirata) {
    return unPirata.item().size <= 10
  && unPirata.items().contains(itemObligatorio)
  }

}

class Saqueo inherits Mision{

  const objetivo
  method esUtil(unPirata) {
    unPirata.monedas()  < cantMonedas.valor()
    //&& objetivo
  }

  override method puedeCompletarMision(unBarco) {
    return 
    super(unBarco)
    && objetivo.vulnerable(unBarco)
  }

}

object cantMonedas {
  var property valor = 10

}


class Ciudad {
  var property habitantes
  method vulnerable(unBarco) =habitantes * 0.4 v unBarco.cantidadTripulantes() ||
  unBarco.estanTodosPasadosDeGrog()

  method saqueadoPor(unPirata) =unPirata.nivelDeEbriedad >=  50

  agregarUnHabitante(nuevoHabitante)

}
