require 'crichton/representor/factory'

class Orders
  extend Crichton::Representor::Factory

  def self.find(params)
    state, orders = find_orders(params)

    #orders_collection = {
    #    total_count: orders.count,
    #    items: orders
    #}
    #build_state_representor(orders_collection, :orders, {state: state})
    orders
  end

  private
  def self.find_orders(params)
    if params.any?
      query = params.map { |k,v| "#{k} like '#{v}'" }.join(' and ')
      [:navigation, Order.where(query).all]
    else
      [:collection, Order.all]
    end
  end
end
