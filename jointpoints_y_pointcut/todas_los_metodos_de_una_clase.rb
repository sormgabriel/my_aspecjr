class TodosLosMetodosDeUnaClaseOConjuntoDeClases

  def initialize(clase)
  @clase=clase
  end
  def metodosDeUnaClaseOConjuntoDeClases
      if(@clase.respond_to?(:collect) && @clase.size>0)
       x=[]
       x=@clase.collect{|cl| cl.instance_methods(false) }
        x.flatten!
      else
      x=@clase.instance_methods(false)
      end
  end

  def execute
    metodosDeUnaClaseOConjuntoDeClases
  end
  end
