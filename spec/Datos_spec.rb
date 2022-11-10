# frozen_string_literal: true
require "spec_helper.rb"

RSpec.describe Parking do
  describe Datos do
    context "Pruebas de la clase Datos" do

      before :all do
        @park1 = Datos.new(3,5,40, "Parking1", "Mixto", "coches", 30, 30)
      end
      it "Pruebas de instancia de la clase Datos" do 
        expect(@park1).not_to eq(nil)
        #expect(@park1.plazas.to_s).not_to eq([2, 2, 2])
      end
      it "Pruebas de obtencion de atributos de un aparcamiento (park1)" do 
        expect(@park1.accesibilidad).to eq(3)
        expect(@park1.seguridad).to eq(5)
        expect(@park1.identificador).to eq(40)
        expect(@park1.nombre_comercial).to eq("Parking1")
        expect(@park1.descripcion).to eq("Mixto")
        expect(@park1.tipo).to eq("coches")
        expect(@park1.estado).to eq("Hay Plazas Libres")
        #expect(@park1.plazas.to_s).not_to eq([2, 2, 2])
      end


    
    end
  end
end