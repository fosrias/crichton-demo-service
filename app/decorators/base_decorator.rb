class BaseDecorator < SimpleDelegator

  def self.decorates(name)
    register_decorators(name, self)
  end

  def self.registered_decorators
    @registered_decorators ||= {}
  end

  private
  def self.register_decorators(name, subclass)
    BaseDecorator.registered_decorators[name.to_sym] = subclass
  end
end
