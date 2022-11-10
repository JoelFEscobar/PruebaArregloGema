# frozen_string_literal: true
require "spec_helper.rb"

RSpec.describe Parking do
  describe Aparcamiento do
    context "Pruebas del módulo Aparcamiento" do

      it "Existe un módulo para representar información del Aparcamiento" do
        expect(Aparcamiento).not_to eq(nil)
      end

      it "Se cuenta con una constante para representar si el aparcamiento esta completo" do
      expect(Aparcamiento.libres(30)).to eq(30)
      end

      it "Se cuenta con una constante para representar si el aparcamiento tiene plazas libres" do
        expect(Aparcamiento.ocupadas(30)).to eq(30)
      end

      it "Se cuenta con una funcion para mostrar el numero total de Aparcamientos" do
        expect(Aparcamiento.totales()).to eq(60)
      end
    end
  end
end