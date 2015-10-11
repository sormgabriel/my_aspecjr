require_relative '../spec/spec_helper'





class Auto
  def velocidad(x,y,r,t,z)
    x+y+r+t+z
  end
  def cantidad_asientos; end
  def vela(x,y);end
  def velita;end
end

class Autito < Auto
  def puertas(x,y,z,r,t);end
  def ventanita(x,y);end

end

describe 'MetodosQueEmpiezanCon' do
  before(:each) do
    @auto = Auto.new
    @jp=MetodosConAridad.new(-2)


  end

  it 'select_responders devuelve la sublista de los objetos dados que entienden todos los selectores registrados en el SelectorList' do
    expect(@jp.execute).to eql([:puertas,:ventanita,:velocidad,:cantidad_asientos,:vela,:velita])
  end


end
