class MetodosQueEmpiezanCon
	def initialize(palabra)
	
	@palabra=palabra
	end

	def todosLosMetodos
		x=[]
		m=[]
		ObjectSpace.each_object(Class){|cl| x << cl}
		m=x.collect{|cl| cl.instance_methods}
		m.flatten!
		m

	end

	def metodosQueEmpiezanCon
		eval("todosLosMetodos.grep /^"+ @palabra+"/")
	end

	def execute
			metodosQueEmpiezanCon
	end

  end
