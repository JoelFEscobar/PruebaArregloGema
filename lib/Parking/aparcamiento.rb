module Aparcamiento
  @@totalPlazas=0
  @@LibresValue=0   #Hay plazas libres 
  @@OcupadasValue=0
  ESTA_COMPLETO=("Esta Lleno")
  ESTA_LIBRE=("Hay Plazas Libres")

  def self.libres(libreParam)
    @@LibresValue = libreParam
  end

  def self.ocupadas(ocupadaParam)
    @@OcupadasValue = ocupadaParam
  end

  def self.totales()
    @@totalPlazas = @@LibresValue + @@OcupadasValue 
  end

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