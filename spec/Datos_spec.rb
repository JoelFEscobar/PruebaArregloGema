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



    end
  end
end