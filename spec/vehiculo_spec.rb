# frozen_string_literal: true
require "spec_helper.rb"
RSpec.describe Parking do
    describe Vehiculo do
      context "Pruebas de la clase Vehiculo" do
        before :all do
          @vehiculo1 = Vehiculo.new("3025-AV", 2, 2, 5, 50)
          @vehiculo2 = Vehiculo.new("6782-GFT", 6, 7,9, 150)
        end

        it "Pruebas de instacia de la clase Vehiculo" do
          expect(@vehiculo1).not_to eq(nil)
          expect(@vehiculo2).not_to eq(nil)
        end
        it "Pruebas del contador de vehiculos" do
          expect(Vehiculo.contador()).to eq(4)
        end

        it "pruebas de Visualizacion de un vehiculo" do
          expect(@vehiculo1.to_s()).to eq("El vehiculo con matricula: 3025-AV tiene 2 metros de alto, 2 metros de ancho, 5 metros de largo y pesa 0.05 toneladas\n")
          expect(@vehiculo2.to_s()).to eq("El vehiculo con matricula: 6782-GFT tiene 6 metros de alto, 7 metros de ancho, 9 metros de largo y pesa 0.15 toneladas\n")
        end
        it "Prueba de que Vehiculo es un vehiculo" do
          expect((@vehiculo1).is_a?Vehiculo).to eq(true) 
        end

        it "Prueba de que Vehiculo es un Object" do
          expect((@vehiculo1).is_a?Object).to eq(true) 
        end

        it "Prueba de que Vehiculo es un BasicObject" do
          expect((@vehiculo1).is_a?BasicObject).to eq(true) 
        end

        it "Prueba de que Vehiculo es un string" do
          expect((@vehiculo1).is_a?String).to eq(false) 
        end

        it "Prueba de que Vehiculo es un Numeric" do
          expect((@vehiculo1).is_a?Numeric).to eq(false) 
        end

        it "Prueba de que Vehiculo es un Hash" do
          expect((@vehiculo1).is_a?Hash).to eq(false) 
        end

      end
    end
end
  