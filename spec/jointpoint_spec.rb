require_relative '../spec/spec_helper'





class Auto
  def velocidad; end
  def cantidad_asientos; end
end

describe 'MetodosConElNombre' do
  before(:each) do
    @auto = Auto.new
    @jp=MetodosConElNombre.new("velocidad")


  end

  it 'MetodosConElNombre.new(nombre).execute devuelve un array con los selectores de los metodos que coinciden con el nombre pasado en el constructor' do
    expect(@jp.execute).to eql([:velocidad])
  end


end
