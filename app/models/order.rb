require 'orders_uuid_base'

class Order < OrdersUuidBase
  include Crichton::Representor::State
  represents :order
  state_method :status
end
