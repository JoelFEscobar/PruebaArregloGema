#@author: Joel Francisco Escobar Socas
module PlazasAparcamiento
    class CaracterisiticasPlazas
    #@param altura  Altura de la plaza
    #@param longitud longitud de la plaza
    #@param anchura anchura de la plaza
      attr_reader :altura, :longitud, :anchura
      #Constructor de la clase CaracteristicasPlazas
      def initialize(array1)
        if (array1.length == 3) then
          @altura = array1[0] 
          @longitud = array1[1] 
          @anchura = array1[2]  
         else
          return nil
        end
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
  