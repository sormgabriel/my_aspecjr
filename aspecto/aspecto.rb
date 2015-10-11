require_relative '../advice/advice'
require_relative '../jointpoints_y_pointcut/point_cut'

class Aspecto
    def initialize(unaInstanciaDePointCut,advice)
      @pointcut=unaInstanciaDePointCut
      @advice=advice
    end


    def advice
      @advice
    end

  def apply
    #es como el execute los jointpoints
    @pointcut.execute
    @pointcut.affected_methods.collect{|clase_selector| @advice.apply_to(clase_selector.at(0),clase_selector.at(1))}
    #tengo que hacer el proc para muchos objetos
  end

end