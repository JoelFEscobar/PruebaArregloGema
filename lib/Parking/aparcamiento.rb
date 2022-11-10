module Aparcamiento
  @@totalPlazas=0
  @@LibresValue=0   #Hay plazas libres 
  @@OcupadasValue=0
  ESTA_COMPLETO=("Lleno")
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

end