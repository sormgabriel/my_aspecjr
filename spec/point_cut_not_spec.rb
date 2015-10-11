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



describe 'MetodosQueEmpiezanCon' do



  before(:each) do
    @punto = Punto.new(1,1)
    @rectangulo=Rectangulo.new

    @pc=PointCutNot.new(TodosLosMetodosDeUnaClaseOConjuntoDeClases.new(Punto))

  end

  it 'select_responders devuelve la sublista de los objetos dados que entienden todos los selectores registrados en el SelectorList' do
    expect(@pc.execute).to ([:shift_left,:set_posicion])
  end


end

