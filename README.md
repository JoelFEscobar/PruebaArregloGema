# Práctica 7: Gema Parking
## Autor: Joel Francisco Escobar Socas

## Introduccion
  El objetivo de esta práctica es implementar una Gema en Ruby para representar a un Aparcamiento con todas sus características. Para realizar todo esto se utilizarán diferentes herramientas proporcionadas por **Ruby**. Especificamente:
  * Bundle: Es una Gema que permite la creación y configuraciónn de una [Gema](https://altenwald.org/2012/01/02/las-gemas-de-ruby/) en Ruby
  * Guard: Es una gema que permite automatizar tareas cuando se detecta algún cambio en el sistema de ficheros. En nuestro caso lo utilizaremos para realizar la ejecución automatizada de pruebas.
  * Yargs: Para realizar la documentación del código.

## Desarrollo

Para el desarrollo de la práctica se solicita crear una clase que represente las caracteristicas de un Aparcamiento y un módulo que implemente la funcionalidad sobre el control de las plazas del aparcamiento, es decir, si estan libres o ocupadas,

### Modulo: Aparcamiento

Para el desarrollo de las pruebas del módulo hay que tener en cuenta que no se pueden instanciar objetos de un modulo ya que un modulo no tiene el mismo comportamiento que una clase, por lo que atendiendo al TDD, antes de comenzar con la implementacion del modulo en ruby se ha definido unas pruebas de constantes que toman cierto valores, y posteirormente se ha implementado en el modulo esta funcionalidad, además hayq eue specificar que nuestra gema parking hace uso de estas pruebas con el `Rspec.decribe Parking do`.De esta manera las pruebas quedan como:

```Ruby
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

      it "Se cuenta con una funcion para mostrar el estado de un aparcamiento (completo, plazas libres)" do
        expect(Aparcamiento.EstadoPlazas()).to eq("Hay Plazas Libres")
      end

    end
  end
end
```

Para el desarrollo del módulo se utiliza la palabra reservada en ruby **module** y en mi caso defino 3 constantes globales. La constante libres que representa un numero de plazas libres, la constante ocupadas que representa un numero de plazas ocupadas y la constantes plazastotales que representa al numero total de plazas del aparcamiento, es decir, es la suma de las plazas libres y las plazas ocupadas.

Además se definen cuatro métodos propios del módulo a través de la palabra **self**. los métodos son el calculo de las constantes que se le pasa. Por ejemplo, el método *totales* lo que hace es que la variable inicializada arriba denominada plazastotales le asigna la suma de las otras dos variables, basicamente son metodos de inicialización. Y el último método, el denominado **EstadoPlazas** lo que hace es comprobar si el parking está vacío o esta completo. Para que el parking tenga plazas libres puedne pasar dos cosas, o que la variable ocupadas no coincida con el numero total de plazas o que la variable libre sea igual a 0, por lo que no hay plazas libres. Por otro lado, para que el estado de aparcamiento sea que esté lleno, solo puedeser debido cuando las plazas ocupadas sea igual al numero total de plazas disponibles en el aparcamiento o el numero total de plazas libres no sea 0.

```Ruby
module Aparcamiento
  @@totalPlazas=0
  @@LibresValue=0   #Hay plazas libres 
  @@OcupadasValue=0
  ESTA_COMPLETO=("Lleno")
  ESTA_LIBRE=("Hay Plazas Libres")

  def self.libres(libreParam)
    @@LibresValue = libreParam
  end

  def self.ocupadas(ocupadaParam)
    @@OcupadasValue = ocupadaParam
  end

  def self.totales()
    @@totalPlazas = @@LibresValue + @@OcupadasValue 
  end

  def self.EstadoPlazas()
    if(@@LibresValue == 0) then
      return ESTA_COMPLETO

    elsif (@@LibresValue != 0) then
      return ESTA_LIBRE

    elsif (@@OcupadasValue == @@totalPlazas) then
     return ESTA_COMPLETO

    elsif (@@OcupadasValue != @@totalPlazas) then
      return ESTA_LIBRE
    end

  end

end
```

### Clase: Datos

Esta clase es la encargada de implementar los datos necesarios de un aparcamiento. COmo estamos usando TDD, previamente a la implementación de la clase Datos creamos el fichero de prueba y escribimos las pruebas y a medida que van fallando hacemos una funcionalidad. El fichero de pruebas obtenido despues de terminar con la funcionalidad esperada por la clase es:

```Ruby
# frozen_string_literal: true
require "spec_helper.rb"

RSpec.describe Parking do
  describe Datos do
    context "Pruebas de la clase Datos" do

      before :all do
        @parking_mercadona = Datos.new(3,5,40, "Parking Mercadona", "Mixto", "coches", 30, 30)
        @parking_Lidl = Datos.new(1, 10, 7594, "Parking Lidl", "Aire Libre", "motos", 0, 10)
        @parking_Carrefour = Datos.new(5, 20, 899302, "Parking Carrefour", "Techo", "bicicletas", 30, 0)


      end
      it "Pruebas de instancia de la clase Datos" do 
        expect(@parking_mercadona).not_to eq(nil)
      end
      it "Pruebas de obtencion de atributos de un aparcamiento (Parking Mercadona)" do 
        expect(@parking_mercadona.accesibilidad).to eq(3)
        expect(@parking_mercadona.seguridad).to eq(5)
        expect(@parking_mercadona.identificador).to eq(40)
        expect(@parking_mercadona.nombre_comercial).to eq("Parking Mercadona")
        expect(@parking_mercadona.descripcion).to eq("Mixto")
        expect(@parking_mercadona.tipo).to eq("coches")
        expect(@parking_mercadona.estado).to eq("Hay Plazas Libres")
      end

      it "Pruebas de obtencion de atributos de un aparcamiento (Parking lidl)" do 
        expect(@parking_Lidl.accesibilidad).to eq(1)
        expect(@parking_Lidl.seguridad).to eq(10)
        expect(@parking_Lidl.identificador).to eq(7594)
        expect(@parking_Lidl.nombre_comercial).to eq("Parking Lidl")
        expect(@parking_Lidl.descripcion).to eq("Aire Libre")
        expect(@parking_Lidl.tipo).to eq("motos")
        expect(@parking_Lidl.estado).to eq("Esta Lleno")
      end

      it "Pruebas de obtencion de atributos de un aparcamiento (parking Carrefour)" do 
        expect(@parking_Carrefour.accesibilidad).to eq(5)
        expect(@parking_Carrefour.seguridad).to eq(nil)
        expect(@parking_Carrefour.identificador).to eq(899302)
        expect(@parking_Carrefour.nombre_comercial).to eq("Parking Carrefour")
        expect(@parking_Carrefour.descripcion).to eq(nil)
        expect(@parking_Carrefour.tipo).to eq("bicicletas")
        expect(@parking_Carrefour.estado).to eq("Hay Plazas Libres")
      end
    
    end
  end
end
```

Para implementar la clase Datos se tiene importar previamente el modulo del que hareemos uso en la clase para la funcionalidad. Para importar un modulo en Ruby lo que se hace es utilizar la palabra **include** de esta forma la línea que importa el modulo previamente definido es `include Aparcamiento`.

Luego definimos la clase con la palabra reservada **Class** y recogemos la serie de atributos que se solicita en el guión de la práctica. Bajo mi punto de vista, los datos que recoge un aparcamiento seria un atributo que indique la accesibilidad que tiene el aparcamient, como pide que sea entre un rango del 1 al 5 siendo 1 el menos accesible posible y 5 el máximo. lo que creo es una funcion que tiene especificado el rango y comprueblo si el valor introducido por el usuario esta entre ese rango si es asi, asigno el valor a el atributo privado y sino es asi devuelvo un **nil**. 

De la misma manera definimos la seguridad del aparcamiento, lo unico que ahora el rango estará comprendido entre 1 y 10. Posteriormente implementamos un atributo que será el identificador del parking o id, este id es asignado directamente al valor que se introduce. recogemos el nombre comercial del parking. Luego analizamos la descripcion del aparcamiento, es decir en un metodo de la clase denominado `TipoDescripcion` se analiza el valor introducido y se comprueba que sea igual a los posibles valores que puede tomar este atributo, es decir, si la descripcion es si está  cubierto, al aire libre o es Mixto, en otras palabras, que tiene una zona al aire libre y en otra zona esta cobuerta en caso de que lo que se introduzca no coincida con esto se devuelve nil. 

También hacemos lo mismo con el atributo tipo, que recoge los tipos de vehiculos que pueden acceder al aparcamiento, puede ser autobuses, bicicletas, coches o motos. en cualquier otro caso, por ejemplo si fueran camiones, entonces devolvemos **nil** puesto que un aparcamiento no puede ser de ese tipo.

y luego le pasamos dos valores, el numero de plazas libres y el numero de plazas ocupadas y creamos un array auxiliar de dos elementos, el primer valor de array serán las plazas libres y el segundo valor las plazas ocupadas las cuales hace uso del modulo aparcamiento. Para hacer uso del modulo, lo que se hace es escribirm el `nombre_modulo.Funcion_modulo`. Asi es como en el primer campo llamamos a la funcion libres definida en el modulo **Aparcamiento** y enb el segundo campo llamamos a la funcionj ocupada definida en el mismo modulo. Luego el atributo que recoge el estado de aparcamiento será la funcion que devuelve el estado de las plazas segun los valores libres y ocupadas.

Sin embargo, falta un atributo más en la clase, el atributo encargado de representar las caracteristicas de una plaza, sus dimensiones. para ello he decidido hacer uso de un modulo que he implementado y del que se hablará más abajo.

```Ruby
include Aparcamiento

class Datos
  attr_reader :accesibilidad, :seguridad, :identificador, :nombre_comercial, :descripcion, :tipo, :estado, :plazas
  
  def initialize(accesibilidad, seguridad, identificador, nombre, descripcion, tipo, libre, ocupado)
    @accesibilidad = Accesibilidad(accesibilidad)
    @seguridad = Seguridad(seguridad)
    @identificador = identificador
    @nombre_comercial = nombre
    @descripcion = TipoDescripcion(descripcion)
    @tipo = TipoAparcamiento(tipo)

    aux = [Aparcamiento.libres(libre),Aparcamiento.ocupadas(ocupado)]
    @estado = Aparcamiento.EstadoPlazas()
  end

  def TipoDescripcion(desc)
    if (desc == "Cubierto" || desc == "Aire Libre" || desc == "Mixto") then
      return desc
    else  
      return nil
    end
  end

  def TipoAparcamiento(tipo)
    if (tipo == "autobuses" || tipo == "bicicletas" || tipo == "coches" || tipo == "motos" ) then
      return tipo
    else  
      return nil
    end
  end

  def Accesibilidad(accesibilidad) 
    range = (1..5).to_a
    if (range.include?(accesibilidad))
      return accesibilidad
    else
      return nil
    end
  end

  def Seguridad(seg) 
    range = (1..10).to_a
    if (range.include?(seg))
      return seg
    else
      return nil
    end
  end

end
```

## Información acerca de la Gema **Parking**
```Markdown
Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/Parking`. To experiment with that code, run `bin/console` for an interactive prompt.

Esta Gema se encarga de representar una clase Aparcamiento que especifique las caracteristicas que tendrá un Aparcamiento, como pude ser su nombre, su numero de plazas etc.

### Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add Parking

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install Parking

### Usage

TODO: Write usage instructions here

### Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

### Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/Parking.
```

## Bibliografía
* [guión](https://campusingenieriaytecnologia2223.ull.es/pluginfile.php/11807/mod_resource/content/44/2223_LPP_p07.pdf)
* []()
* []()
* []()
* []()
* []()
