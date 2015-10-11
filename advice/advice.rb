class Advice

  def apply_to(clase,selector)

    eval("clase.send(:alias_method,:#{selector}_new,:#{selector})")
    #clase.send(:define_method,:selector,)
    #clase.send(selector)no se puede si selector no es de instancia es de instancia #1

  end

  def redefine_method(objeto,clase,selector,&block)
    #lluvia de ifs
    #posible implementacion
    #
    aridad=objeto.method(selector).arity
    if(aridad>0)
      @selector_new=eval":#{selector}_new"
      p=Proc.new{|par|objeto.send(@selector_new,par)}
      if(@before)
      clase.send(:define_method,selector){|x|block.call;p.call(x)}
      else
      clase.send(:define_method,selector){|x|p.call(x);block.call}
      end
    else
      @selector_new=eval":#{selector}_new"
      p=Proc.new{|par|objeto.send(@selector_new)}
      if(@before)
        clase.send(:define_method,selector){block.call;p.call}
      else
        clase.send(:define_method,selector){var = p.call;block.call ; var}
      end
    end
  end



  def apply_after
    @before=false
  end

  def apply_before
    @before=true
  end






  def code(proc)
    proc
  end

end