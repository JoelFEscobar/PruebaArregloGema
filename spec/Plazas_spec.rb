# frozen_string_literal: true
require "spec_helper.rb"
RSpec.describe Parking do
    describe PlazasAparcamiento::CaracterisiticasPlazas do
        context "Pruebas del módulo Plaza Aparcamiento" do
            before :all do
                @plaza1 = PlazasAparcamiento::CaracterisiticasPlazas.new([2, 2, 2])
            end
            it "Existe un módulo para representar información del Aparcamiento" do
                expect(PlazasAparcamiento::CaracterisiticasPlazas).not_to eq(nil)
                expect(@plaza1).not_to eq(nil)
                
            end
            it "Metodo de visualizacion" do 
                expect(@plaza1.to_s()).to eq("[ 2, 2, 2 ]\n")
              end

        end
    end
end
  