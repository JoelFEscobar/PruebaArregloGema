#@author: Joel Francisco Escobar Socas
module Aparcamiento
  #@param totalPlazas Plazas totales que tiene el aparcaiento que sera la suma de libres y ocupadas
  #@param LibresValue Numero de plazas libres
  #@param OcupadasValue Numero de plazas ocupadas
  #@param ESTA_COMPLETO string que devuelve si esta coupado
  #@param ESTA_LIBRE string que devuelve si no esta ocupado

  @@totalPlazas=0 
  @@LibresValue=0   #Hay plazas libres 
  @@OcupadasValue=0
  ESTA_COMPLETO=("Esta Lleno")
  ESTA_LIBRE=("Hay Plazas Libres")

  #Funcion encargada de asignar un numero de plazas libres
  def self.libres(libreParam)
    @@LibresValue = libreParam
  end

  #Funcion encargada de asignar un numero de plazas ocupadas
  def self.ocupadas(ocupadaParam)
    @@OcupadasValue = ocupadaParam
  end

  #Funcion encargada de asignar un numero de plazas totales al aparcamiento
  def self.totales()
    @@totalPlazas = @@LibresValue + @@OcupadasValue 
  end

  #Funcion encargada de devolver en base a la informaciond e las plazas un estado
  def self.EstadoPlazas()
    if(@@LibresValue == 0) then
      return ESTA_COMPLETO

    elsif (@@LibresValue != 0) then
      return ESTA_LIBRE

    elsif (@@OcupadasValue == @@totalPlazas) then
     return ESTA_COMPLETO

    elsif (@@OcupadasValue != @@totalPlazas) then
      return ESTA_LIBRE
    end

  end

end