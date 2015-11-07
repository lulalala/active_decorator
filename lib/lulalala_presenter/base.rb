module LulalalaPresenter
  class Base
    attr_accessor :model

    def initialize(model)
      @model = model
    end

    def view_context
      @view_context ||= ActiveDecorator::ViewContext.current
    end
    alias_method :h, :view_context
  end
end
