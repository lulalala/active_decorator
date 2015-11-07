module LulalalaPresenter
  module ActiveModelBridge
    def presenter
      return @_presenter if @_presenter

      klass = "#{self.class.name}Presenter".constantize
      @_presenter = klass.new(self)
    end
  end
end
