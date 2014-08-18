require 'drd_decorator'
require 'drds_decorator'

module ServiceObject
  def method_missing(method, *args, &block)
    if method =~ /^build_(\w*)_object$/
      send(:build_service_object, $1, *args, &block)
    else
      super
    end
  end

  private
  def build_service_object(name, object)
    if decorator = BaseDecorator.registered_decorators[name.to_sym]
      decorator.new(object)
    else
      raise "No decorators are registered to decorate #{name}"
    end
  end
end