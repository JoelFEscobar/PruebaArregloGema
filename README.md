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
