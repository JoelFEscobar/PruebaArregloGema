module PlazasAparcamiento
    class CaracterisiticasPlazas
      attr_reader :altura, :longitud, :anchura
      def initialize(array1)
        if (array1.length == 3) then
          @altura = array1[0] 
          @longitud = array1[1] 
          @anchura = array1[2]  
         else
          return nil
        end
      end
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
  