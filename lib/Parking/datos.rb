#@author: Joel Francisco Escobar Socas
class Datos
  #@param accesibilidad rango de como de accesible es el aparcamiento
  #@param seguridad rango de como de seguro es el aparcamiento
  #@param identificador identificador del aparcamiento
  #@param nombre_comercial nombre comercial del aparcamiento
  #@param descripcion tipo de descripcion del aparcamiento (cubierto, aire libre, mixto)
  #@param tipo tipo de vehiculos del aparcamiento (autobus, coche, moto, bicibleta)
  #@param plazas dimensiones de la plaza del aparcamiento
  #@param estado estado del aparcamiento en funcion de si hay plazas lirbes o ocupadas

  attr_reader :accesibilidad, :seguridad, :identificador, :nombre_comercial, :descripcion, :tipo, :estado
  #Constructor de la plaza
  def initialize(accesibilidad, seguridad, identificador, nombre, descripcion, tipo, libre, ocupado, array)
    @accesibilidad = Accesibilidad(accesibilidad)
    @seguridad = Seguridad(seguridad)
    @identificador = identificador
    @nombre_comercial = nombre
    @descripcion = TipoDescripcion(descripcion)
    @tipo = TipoAparcamiento(tipo)
    #@plazas = PlazasAparcamiento::CaracterisiticasPlazas.new(array)
    @plazas = array
    @estado = Aparcamiento.EstadoPlazas()
  end

  #Funcion que comprueba si coincide el tipo de descripcion con una dada
  def TipoDescripcion(desc)
    if (desc == "Cubierto" || desc == "Aire Libre" || desc == "Mixto") then
      return desc
    else  
      return nil
    end
  end

  #Funcion que comprueba si coincide el tipo de vehiculo con un tipo dado
  def TipoAparcamiento(tipo)
    if (tipo == "autobuses" || tipo == "bicicletas" || tipo == "coches" || tipo == "motos" ) then
      return tipo
    else  
      return nil
    end
  end

  #Funcion que comprueba si el valor que se le pasa esta entre unr ango del 1..5
  def Accesibilidad(accesibilidad) 
    range = (1..5).to_a
    if (range.include?(accesibilidad))
      return accesibilidad
    else
      return nil
    end
  end

  #Funcion que comprueba si el valor que se le pasa esta entre unr ango del 1..10
  def Seguridad(seg) 
    range = (1..10).to_a
    if (range.include?(seg))
      return seg
    else
      return nil
    end
  end

end