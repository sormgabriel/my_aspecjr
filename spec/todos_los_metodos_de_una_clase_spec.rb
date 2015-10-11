require_relative '../spec/spec_helper'





class Auto
  def velocidad; end
  def cantidad_asientos; end
  def vela;end
  def velita;end
end

describe 'MetodosQueEmpiezanCon' do
  before(:each) do
    @auto = Auto.new
    @jp=TodosLosMetodosDeUnaClaseOConjuntoDeClases.new(Auto)


  end

  it 'select_responders devuelve la sublista de los objetos dados que entienden todos los selectores registrados en el SelectorList' do
    expect(@jp.execute).to eql([:velocidad,:cantidad_asientos,:vela,:velita])
  end


end
