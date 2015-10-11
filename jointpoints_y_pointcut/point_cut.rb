class PointCuts


	def affected_classes

		@clasesAfectadas
	end


		def affected_methods
		afectados=@clasesAfectadas.collect{|cl| enganchar(cl)}
		afectados.flatten!
		afectados.each_slice(2).to_a
		end

		def enganchar(clase)
			lista_de_lista_de_clase_selector=(clase.instance_methods(false).&@affected_methods).collect{|m| [clase,m]}
			lista_de_lista_de_clase_selector
		end

		def affects_method?(clase,selector)
			(!(@affected_methods.&clase.instance_methods(false)).empty?) & (affected_classes.include?(clase))
		end

	def clases_afectadas(metodos_afectados)
		x=[]
		ObjectSpace.each_object(Class){|o| x << o}
		@clasesAfectadas=x.select{|o| !(o.instance_methods(false).&(metodos_afectados).empty?)}
	end

end
