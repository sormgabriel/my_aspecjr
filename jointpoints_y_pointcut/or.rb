require_relative '../jointpoints_y_pointcut/point_cut'
class PointCutOr < PointCuts
  def initialize(jointPoint1,jointPoint2)
    @pointcut1=jointPoint1
    @pointcut2=jointPoint2
  end

  def execute
    @affected_methods=@pointcut1.execute.|(@pointcut2.execute)
    clases_afectadas(@affected_methods)
    @affected_methods

  end


end