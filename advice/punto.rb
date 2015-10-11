class Punto
  def initialize(x,y)
    @x=x
    @y=y

  end


  def shift_left(how_long)

    @x=@x+how_long
  end

end