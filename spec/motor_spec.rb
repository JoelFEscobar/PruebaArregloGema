# frozen_string_literal: true
require "spec_helper.rb"
RSpec.describe Parking do
    describe Motor do
        context "Pruebas de la clase Vehiculo de Motor" do
            before :all do
              @vehiculoMotor1 = Motor.new("3025-AV", 2, 2, 5, 150, 4, 5, 500, 6, 120)
              @vehiculoMotor2 = Motor.new("6782-GFT", 6, 7,9, 50, 2, 2, 180, 4, 220)
            end
    
            it "Pruebas de instacia de la clase Vehiculo de Motor" do
              expect(@vehiculoMotor1).not_to eq(nil)
              expect(@vehiculoMotor2).not_to eq(nil)
            end
    
            it "pruebas de Visualizacion de un vehiculo motor" do
              expect(@vehiculoMotor1.to_s()).to eq("El vehiculo con matricula: 3025-AV tiene 2 metros de alto, 2 metros de ancho, 5 metros de largo y pesa 0.15 toneladas\nEl vehiculo es de motor y tiene 4 ruedas, es de 5 plazas, 3000 centimetros cubicos, 120 km/h maximos.")
              expect(@vehiculoMotor2.to_s()).to eq("El vehiculo con matricula: 6782-GFT tiene 6 metros de alto, 7 metros de ancho, 9 metros de largo y pesa 0.05 toneladas\nEl vehiculo es de motor y tiene 2 ruedas, es de 2 plazas, 720 centimetros cubicos, 220 km/h maximos.")
            end

            it "Prueba de que Vehiculo es un Vehiculo motor" do
                expect((@vehiculoMotor1).is_a?Motor).to eq(true) 
            end

            it "Prueba de que Vehiculo es un vehiculo" do
              expect((@vehiculoMotor1).is_a?Vehiculo).to eq(true) 
            end
    
            it "Prueba de que Vehiculo es un Object" do
              expect((@vehiculoMotor1).is_a?Object).to eq(true) 
            end
    
            it "Prueba de que Vehiculo es un BasicObject" do
              expect((@vehiculoMotor1).is_a?BasicObject).to eq(true) 
            end
    
            it "Prueba de que Vehiculo es un String" do
              expect((@vehiculoMotor1).is_a?String).to eq(false) 
            end
    
            it "Prueba de que Vehiculo es un Numeric" do
              expect((@vehiculoMotor1).is_a?Numeric).to eq(false) 
            end
    
            it "Prueba de que Vehiculo es un Hash" do
              expect((@vehiculoMotor1).is_a?Hash).to eq(false) 
            end
            
            it "Prueba del metodo <=> de la clase motor" do
                expect(@vehiculoMotor1 > @vehiculoMotor2).to eq(true)
            end

           
          end
        end

end

  