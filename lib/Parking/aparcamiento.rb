#@author: Joel Francisco Escobar Socas
module Aparcamiento
  #@param totalPlazas Plazas totales que tiene el aparcaiento que sera la suma de libres y ocupadas
  #@param LibresValue Numero de plazas libres
  #@param OcupadasValue Numero de plazas ocupadas
  #@param ESTA_COMPLETO string que devuelve si esta coupado
  #@param ESTA_LIBRE string que devuelve si no esta ocupado

  ESTA_COMPLETO=("Esta Lleno")
  ESTA_LIBRE=("Hay Plazas Libres")

  #Funcion encargada de devolver en base a la informaciond e las plazas un estado
  def self.EstadoPlazas()
    if(Aparcamiento::Plazas.Libres() == 0) then
      return ESTA_COMPLETO

    elsif (Aparcamiento::Plazas.Libres() != 0) then
      return ESTA_LIBRE
    else
      return nil
    end
  end

end