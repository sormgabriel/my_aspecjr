require_relative '../spec/spec_helper'

class Punto

  def initialize(x,y)
    @x=x
    @y=y

  end

  def shift_left(d)
    d+1

  end

  def set_posicion(x,y)

  end

end

class Rectangulo
  def set_esquinas;end

  def shift_left(d)
    d+1

  end
end



RSpec.describe 'PointCutAnd' do



  before(:each) do
    @punto = Punto.new(1,1)
    @rectangulo=Rectangulo.new

    @pc=PointCutOr.new(TodosLosMetodosDeUnaClaseOConjuntoDeClases.new(Punto),TodosLosMetodosDeUnaClaseOConjuntoDeClases.new(Rectangulo))
    @pc2=PointCutAnd.new(@pc,MetodosQueEmpiezanCon.new("set"))

  end

  it 'select_responders devuelve la sublista de los objetos dados que entienden todos los selectores registrados en el SelectorList' do
    expect(@pc2.execute).to eql([:set_posicion,:set_esquinas])
  end


  it ':affected_methods deberia devolver [[Punto,:set_posicion],[Punto,:set_esquina],[Rectangulo,:set_esquina],[Rectangulo,:set_posicion]] ' do
    @pc2.execute
    expect(@pc2.affected_methods).to eql([[Rectangulo,:set_esquinas],[Punto,:set_posicion]])
  end

  it ':affects_methods? deberia devolver true para Rectangulo :set_esquinas ' do
    @pc2.execute
    expect(@pc2.affects_method?(Rectangulo,:set_esquinas)).to eql(true)
  end

end


