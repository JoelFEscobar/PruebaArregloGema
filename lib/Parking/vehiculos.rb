
module Aparcamiento
  #Clase que representa a un vehiculos
  class Vehiculo
    attr_reader :matricula, :altura, :ancho, :largo, :peso, :volumen
    include Comparable 
    @@contador = 0
    def initialize(matricula, altura, ancho, largo, peso)
      @matricula = expresion(matricula)
      @altura = altura
      @ancho = ancho
      @largo = largo
      @peso = peso(peso)
      @volumen = @altura.to_i * @ancho.to_i * @alto.to_i
      @@contador += 1
    end

    def expresion(frase)
      expresion_regular = /^[0-9][0-9][0-9][0-9]-[A-Z][A-Z][A-Z]|^[0-9][0-9][0-9][0-9]-[A-Z][A-Z]/
      macheo = expresion_regular.match(frase)

      if (macheo) then
        return macheo
      else
        return nil
      end

    end

    ##Cosas que ha hecho tu amorcito
    def peso(peso)
      toneladas = peso / 1000.0
    end
    ##Cosas que ha hecho tu amorcito
    def self.contador()
      @@contador
    end

    def to_s()
      out = ""
      out += "El vehiculo con matricula: #{@matricula} tiene #{@altura} metros de alto, #{@ancho} metros de ancho, #{@largo} metros de largo y pesa #{@peso} toneladas\n" 
    end
    def <=> (otro_vehiculo)
      return nil unless otro_vehiculo.instance_of? Vehiculo
      @volumen <=> otro_vehiculoMotor.volumen
    end

  end
end