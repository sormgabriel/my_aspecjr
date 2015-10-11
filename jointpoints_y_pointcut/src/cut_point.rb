class CutPoint
#si no le paso una clase por parametro
  initialize(clase,*point_cuts)
  #Un ​ point­cut ​ es el resultado de combinar join­points, usando los operadores “Y”, “O” y “NO”.
     # P.ej. un point­cut posible es “todos los métodos definidos en Punto o en Rectangulo, cuyo
  #selector empiece con ‘set’, y que lleven un parámetro”.
      def affected_classes(*aspecto)
    # devuelve el conjunto de clases para las cuales el alcance del
    #join­point o point­cut incluye al menos uno de los métodos que define la clase.
    clases=[]
  end
    def affected_methods
      #devuelve un conjunto de pares <clase,selector> para los métodos
    #en el alcance del join­point o point­cut.
    end
      def affects_method?(clase, selector)
        #que indica si un método está incluido o no en el
    #alcance.del join­point o point­cut. P.ej. si defino pointCutPunto como “todos los
    #métodos de Punto” y pointCutEs como “todos los métodos cuyo selector empieza con
    #‘es’ “, entonces
  end


end