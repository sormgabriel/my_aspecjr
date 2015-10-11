class TodosLosMetodosDeUnaClaseYSusHijos
  def initialize(clase)
    @clase=clase
    @hijos=[]
  end

  def hijos
    o=[]
    ObjectSpace.each_object(Class){|obj| o << obj}
    @hijos=o.select {|ob| ob.ancestors.include?(@clase)}


  end

  def metodosDeUnaClaseOConjuntoDeClases
    if(@hijos.respond_to?(:collect) && @hijos.size>0)
      x=[]
      x=@hijos.collect{|cl| cl.instance_methods(false) }
      x.flatten!
    else
      x=@hijos.instance_methods(false)
    end
  end

  def metodosDeUnaClaseYSusHijos
    hijos
    metodosDeUnaClaseOConjuntoDeClases
  end

  def execute
    metodosDeUnaClaseYSusHijos

  end


end
