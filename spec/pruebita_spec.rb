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
RSpec.describe 'Aspecto' do
  before(:each) do

    @ar=MetodosConAridad.new(5)
  end



  it 'shift_left interceptado devuelve lo que dice redefine_method y p' do



    expect(@ar.pasar_todos_los_metodos_de_todas_las_clases).to eql([:puertas,:velocidad])
  end




end