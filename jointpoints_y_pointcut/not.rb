require_relative '../jointpoints_y_pointcut/point_cut/'
class PointCutNot < PointCuts
  def initialize(pointcut)
    @pointcut=pointcut
    @universoDeClases=[]
    ObjectSpace.each_object(Class){|o| @universoDeClases << o}
    @universoDeMetodos=@universoDeClases.collect{|cl| cl.methods}
    @universoDeMetodos.flatten!
    @universoDeMetodos.uniq!
  end



  def execute
    @affected_methods=@universoDeMetodos-@pointcut.execute
    clases_afectadas(@affected_methods)
    @affected_methods
  end

end