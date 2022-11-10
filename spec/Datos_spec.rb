# frozen_string_literal: true
require "spec_helper.rb"

RSpec.describe Parking do
  describe Datos do
    context "Pruebas de la clase Datos" do

      before :all do
        @parking_mercadona = Datos.new(3,5,40, "Parking Mercadona", "Mixto", "coches", 30, 30, [2, 2, 2])
        @parking_Lidl = Datos.new(1, 10, 7594, "Parking Lidl", "Aire Libre", "motos", 0, 10, [200, 200, 400])
        @parking_Carrefour = Datos.new(5, 20, 899302, "Parking Carrefour", "Techo", "bicicletas", 30, 0, [15, 13, 10])


      end
      it "Pruebas de instancia de la clase Datos" do 
        expect(@parking_mercadona).not_to eq(nil)
        expect(@parking_Lidl).not_to eq(nil)
      end
      it "Pruebas de obtencion de atributos de un aparcamiento (Parking Mercadona)" do 
        expect(@parking_mercadona.accesibilidad).to eq(3)
        expect(@parking_mercadona.seguridad).to eq(5)
        expect(@parking_mercadona.identificador).to eq(40)
        expect(@parking_mercadona.nombre_comercial).to eq("Parking Mercadona")
        expect(@parking_mercadona.descripcion).to eq("Mixto")
        expect(@parking_mercadona.tipo).to eq("coches")
        expect(@parking_mercadona.estado).to eq("Hay Plazas Libres")
        expect(@parking_mercadona.plazas.to_s()).to eq("[ 2, 2, 2 ]\n")
      end

      it "Pruebas de obtencion de atributos de un aparcamiento (Parking lidl)" do 
        expect(@parking_Lidl.accesibilidad).to eq(1)
        expect(@parking_Lidl.seguridad).to eq(10)
        expect(@parking_Lidl.identificador).to eq(7594)
        expect(@parking_Lidl.nombre_comercial).to eq("Parking Lidl")
        expect(@parking_Lidl.descripcion).to eq("Aire Libre")
        expect(@parking_Lidl.tipo).to eq("motos")
        expect(@parking_Lidl.estado).to eq("Esta Lleno")
        expect(@parking_Lidl.plazas.to_s()).to eq("[ 200, 200, 400 ]\n")
      end

      it "Pruebas de obtencion de atributos de un aparcamiento (parking Carrefour)" do 
        expect(@parking_Carrefour.accesibilidad).to eq(5)
        expect(@parking_Carrefour.seguridad).to eq(nil)
        expect(@parking_Carrefour.identificador).to eq(899302)
        expect(@parking_Carrefour.nombre_comercial).to eq("Parking Carrefour")
        expect(@parking_Carrefour.descripcion).to eq(nil)
        expect(@parking_Carrefour.tipo).to eq("bicicletas")
        expect(@parking_Carrefour.estado).to eq("Hay Plazas Libres")
        expect(@parking_Carrefour.plazas.to_s()).to eq("[ 15, 13, 10 ]\n")
      end
    
    end
  end
end