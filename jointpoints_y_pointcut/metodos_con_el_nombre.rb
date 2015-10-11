class MetodosConElNombre
	
	
	def initialize(nombre)
	@nombre=nombre
	end
	
	def todosLosMetodos
	    x=[]
	    m=[]
	    ObjectSpace.each_object(Class){|cl| x << cl}
	    m=x.collect{|cl| cl.instance_methods}
	    m.flatten!
	    m
	    
	end
	
	def metodosConElNombre
		eval("todosLosMetodos.select { |m| m==:"+@nombre+"}")
	end


	def execute
		metodosConElNombre

	end
end
