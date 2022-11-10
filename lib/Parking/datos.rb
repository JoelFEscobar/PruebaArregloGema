include Aparcamiento



class Datos
  attr_reader :accesibilidad, :seguridad, :identificador, :nombre, :descripcion, :tipo, :estado, :plazas
  
  def initialize(accesibilidad, seguridad, identificador, nombre, descripcion, tipo, libre, ocupado)
    @accesibilidad = Accesibilidad(accesibilidad)
    @seguridad = Seguridad(seguridad)
    @id = identificador
    @nombre_comercial = nombre
    @descripcion = TipoDescripcion(descripcion)
    @tipo = TipoAparcamiento(tipo)
    #@plazas = PlazasAparcamiento::CaracterisiticasPlazas.new(array)
    aux = [Aparcamiento.libres(libre),Aparcamiento.ocupadas(ocupado)]
    @estado = Aparcamiento.EstadoPlazas()
  end

  def TipoDescripcion(desc)
    if (desc == "Cubierto" || desc == "Aire Libre" || desc == "Mixto") then
      return desc
    else  
      return nil
    end
  end

  def TipoAparcamiento(tipo)
    if (tipo == "autobuses" || tipo == " bicicletas" || tipo == "coches" || tipo == "motos" ) then
      return tipo
    else  
      return nil
    end
  end

  def Accesibilidad(accesibilidad) 
    range = (1..5).to_a
    if (range.include?(accesibilidad))
      return accesibilidad
    else
      return nil
    end
  end

  def Seguridad(seg) 
    range = (1..10).to_a
    if (range.include?(seg))
      return seg
    else
      return nil
    end
  end

end