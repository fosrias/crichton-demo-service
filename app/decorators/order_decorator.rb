require 'crichton/representor'
require 'order_extensions'

class OrderDecorator < BaseDecorator
  include OrderExtensions
  include Crichton::Representor::State

  decorates :order
  represents :order
  state_method :status
end
