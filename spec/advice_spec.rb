require_relative '../spec/spec_helper'

class Ganso

  def chau
    1
  end

end
class Punto
  def initialize(x,y)
    @x=x
    @y=y
  end

  def shift_left(how_long)
    @x=@x + how_long

  end

  def x
    @x
  end

end
class AcumuladorDeLlamadas
  def initialize(x)
    @count=x
  end

  def acumular
    @count=@count+1
  end

  def acumulado
    @count
  end
end

RSpec.describe 'Advice' do
  before(:each) do
    @interceptor = Advice.new




  end

  it 'shift_left sin ser interceptado devuelve el x del punto mas la cantidad pasada por parametro' do
    punto=Punto.new(5,3)
    expect(punto.shift_left(2)).to eql(7)
  end

  it 'shift_left interceptado devuelve lo que dice redefine_method y p' do
    @acu = AcumuladorDeLlamadas.new(0)

    punto=Punto.new(5,3)
    ganzo=Ganso.new
    @interceptor.apply_to(Punto,:shift_left)
    p=Proc.new{@acu.acumular}
    p1=Proc.new{|objeto,clase,selector,args| @interceptor.redefine_method(objeto,clase,selector,&p)}
    @interceptor.code(p1).call(punto,Punto,:shift_left)
    punto.shift_left(1)
    punto.shift_left(1)
    punto.shift_left(1)
    ganzo.chau
    ganzo.chau

    expect(@acu.acumulado).to eql(3)
  end
  it 'el metodo chau de Ganso no lleva parametros ' do
    @acu = AcumuladorDeLlamadas.new(0)

    ganso=Ganso.new
    @interceptor.apply_to(Ganso,:chau)
    p=Proc.new{@acu.acumular}
    p1=Proc.new{|objeto,clase,selector,args| @interceptor.redefine_method(objeto,clase,selector,&p)}
    @interceptor.code(p1).call(ganso,Ganso,:chau)

    ganso.chau
    ganso.chau

    expect(@acu.acumulado).to eql(2)
  end



end
