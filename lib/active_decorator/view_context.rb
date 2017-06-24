# frozen_string_literal: true
module ActiveDecorator
  module ViewContext
    class << self
      def current
        view_context_stack.last
      end

      def push(view_context)
        view_context_stack.push view_context
      end

      def pop
        view_context_stack.pop
      end

      def view_context_stack
        Thread.current[:active_decorator_view_contexts] ||= []
      end

      def run_with(view_context, &block)
        push view_context
        block.call
      ensure
        pop
      end
    end

    module Filter
      extend ActiveSupport::Concern

      included do
        if Rails::VERSION::MAJOR >= 4
          around_action do |controller, blk|
            ActiveDecorator::ViewContext.run_with(controller.view_context) do
              blk.call
            end
          end
        else
          around_filter do |controller, blk|
            ActiveDecorator::ViewContext.run_with(controller.view_context) do
              blk.call
            end
          end
        end
      end
    end
  end
end
