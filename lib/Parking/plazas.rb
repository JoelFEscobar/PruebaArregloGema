#@author: Joel Francisco Escobar Socas
module Aparcamiento
  class Plazas
    #@param altura  Altura de la plaza
    #@param longitud longitud de la plaza
    #@param anchura anchura de la plaza
    @@PlazaLibre=0
    @@PlazaOcupada=0
      attr_reader :altura, :longitud, :anchura, :estado
      #Constructor de la clase CaracteristicasPlazas
    def initialize(array1,estado)
      if (array1.length == 3) then
        @altura = array1[0] 
        @longitud = array1[1] 
        @anchura = array1[2]
      else
        return nil
      end
      @estado = estado

      if(estado == 0) then @@PlazaLibre += 1
      elsif(estado == 1) then @@PlazaOcupada += 1
      else return nil
       end
    end
    def self.reset()
      @@PlazaLibre=0
      @@PlazaOcupada=0
    end
    def self.Libres()
      @@PlazaLibre
    end
    def self.Ocupadas()
      @@PlazaOcupada
    end
    def self.plazas_totales()
      return total = @@PlazaLibre + @@PlazaOcupada
    end
    #Metodo de visualizacion de la clase
    def to_s()
      out = ""
      out += "[ "
      out += "#{@altura}, "
      out += "#{@longitud}, "
      out += "#{@anchura}"
      out += " ]\n"
    end
  end
end