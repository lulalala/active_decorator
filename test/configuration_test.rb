require 'test_helper'

Comic = Struct.new(:title, :price)

class ComicPresenter < LulalalaPresenter::Base
  def price
    "$#{super}"
  end
end

class ConfigurationTest < Test::Unit::TestCase
  test 'with a custom decorator_suffix' do
    pend
    begin
      ActiveDecorator.configure do |config|
        config.decorator_suffix = 'Presenter'
      end

      comic = Comic.new("amatsuda's (Poignant) Guide to ActiveDecorator", 3)
      assert_equal '$3', comic.presenter.price
    ensure
      LulalalPresenter.configure do |config|
        config.decorator_suffix = 'Presenter'
      end
    end
  end
end
