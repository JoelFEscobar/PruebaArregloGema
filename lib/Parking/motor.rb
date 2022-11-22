module Aparcamiento
  class Motor < Vehiculo
    include Comparable
    attr_reader :n_ruedas, :n_plazas, :potencia, :velocidad_maxima
    def initialize(matricula, altura, ancho, largo, peso, n_ruedas, n_plazas, potencia, n_cilindro, velocidad_maxima)
      super(matricula, altura, ancho, largo, peso)
      @n_ruedas = ComprobarRango(n_ruedas)
      @n_plazas = ComprobarRango(n_plazas)
      @potencia = CalcularPotencia(potencia, n_cilindro)
      @velocidad_maxima = KilometroMaximo(velocidad_maxima)
    end

    def to_s()
      out = ""
      out += super.to_s
      out += "El vehiculo es de motor y tiene #{@n_ruedas} ruedas, es de #{@n_plazas} plazas, #{@potencia} centimetros cubicos, #{@velocidad_maxima} km/h maximos."
    end
    
    def ComprobarRango(valor)
      range = (1..9).to_a
      if (range.include?(valor))
        return valor
      else
        return nil
      end
    end

    def CalcularPotencia(potencia, cilindro)
      cilindrada_total = potencia * cilindro 
    end

    def KilometroMaximo(max_value)
      range = (10..300).to_a
      if (range.include?(max_value))
        return max_value
      else
        return nil
      end
    end

    def <=> (otro_vehiculoMotor)
      return nil unless otro_vehiculoMotor.instance_of? Motor
      @n_plazas <=> otro_vehiculoMotor.n_plazas
    end

  end
end