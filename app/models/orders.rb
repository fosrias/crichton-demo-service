require 'crichton/representor/factory'

class Orders
  extend Crichton::Representor::Factory

  def self.find(search_term)
    state, orders = find_orders(search_term)

    orders_collection = {
        total_count: orders.count,
        items: orders
    }
    build_state_representor(orders_collection, :orders, {state: state})
  end

  private

  def self.find_orders(search_term)
    if search_term
      #[:navigation,
      # Drd.where('name LIKE ? or status LIKE ? or kind LIKE ?', *3.times.map { "%#{search_term}%" }).all]
    else
      [:collection,
       Order.all]
    end
  end
end