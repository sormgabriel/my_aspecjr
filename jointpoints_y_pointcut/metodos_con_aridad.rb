class MetodosConAridad
  def initialize(aridad)
    @aridad=aridad
  end

  def metodosConAridad
    #Restringir a métodos con una determinada aridad
    j=[]
    #j=todosLosMetodos.select{|m| m.to_proc.arity== @aridad }
    j=todosLosMetodos.select{|m| m.to_proc.arity== @aridad }

    j
  end

  def todosLosMetodos
    x=[]
    m=[]
    ObjectSpace.each_object(Class){|cl| x << cl}
    m=x.collect{|cl| cl.instance_methods}
    m.flatten!
    m.uniq!

  end


  def dameTusMetodos(clase)

      x=[]
      x=clase.instance_methods(false)
      x.flatten!
      x


  end
  def pasar_todos_los_metodos_de_todas_las_clases
    x=[]
    z=[]
    ObjectSpace.each_object(Class){|cl| x << cl}
    z=x.collect{|cl| pasar_todos_los_metodos_a_Method(cl)}
  end

  def pasar_todos_los_metodos_a_Method(clase)
    clase.methods.select { |m| clase.instance_method(m).arity==@aridad }
  end

  def execute
    metodosConAridad

  end

end