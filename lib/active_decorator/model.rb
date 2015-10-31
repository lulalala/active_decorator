module ActiveDecorator
  module Model
    def decorator
      return @_decorator if @_decorator

      klass = "#{self.class.name}Decorator".constantize
      @_decorator = klass.new(self)
    end
  end
end
