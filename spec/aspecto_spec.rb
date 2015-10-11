require_relative '../spec/spec_helper'

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


class Raya
  def initialize(x1,x2)
    @x1=x1
    @x2=x2
  end


  def shift_left(how_long)

    @x=@x+how_long
  end

  def shift_right(how_long)
    @y=@y+how_long
  end

end
class Punto
    def initialize(x,y)
      @x=x
      @y=y
    end


  def shift_left(how_long)

    @x=@x+how_long
  end

  def cord
    [@x,@y]
  end

end

class Rectangulo

  def initialize(x,y)
    @x=x
    @y=y
  end

  def cord
    [@x,@y]

  end

  def shift_right(how_long)
    @y=@y+how_long
  end
end

RSpec.describe 'Aspecto' do
  before(:each) do



    @interceptor = Advice.new
    @interceptor.apply_before
    @jp1=TodosLosMetodosDeUnaClaseOConjuntoDeClases.new(Punto)
    @jp2=TodosLosMetodosDeUnaClaseOConjuntoDeClases.new(Rectangulo)
    @jp3=MetodosQueEmpiezanCon.new("shift")
    @pc1=PointCutOr.new(@jp1,@jp2)
    @pc2=PointCutAnd.new(@pc1,@jp3)
    @aspecto= Aspecto.new(@pc2,@interceptor)


  end



  it 'shift_left interceptado devuelve lo que dice redefine_method y p' do
    @acu = AcumuladorDeLlamadas.new(0)

    punto=Punto.new(5,3)
    @aspecto.apply
    @aspecto.advice
    p=Proc.new{@acu.acumular}
    p1=Proc.new{|objeto,clase,selector,args| @aspecto.advice.redefine_method(objeto,clase,selector,&p)}
    @aspecto.advice.code(p1).call(punto,Punto,:shift_left)

    expect(punto.shift_left(2)).to eql(7)
  end

  it 'shift_right interceptado devuelve lo que dice redefine_method y p' do
    punto=Rectangulo.new(5,3)
    @aspecto.apply
    @aspecto.advice
    p=Proc.new{|x| 5 + punto.shift_right_new(x)}
    p1=Proc.new{|objeto,clase,selector,args| @aspecto.advice.redefine_method(objeto,clase,selector,&p)}
    @aspecto.advice.code(p1).call(punto,Rectangulo,:shift_right)

    expect(punto.shift_right(2)).to eql(10)
  end


end