require 'crichton/representor/factory'
require 'order_extensions'

class OrdersDecorator < BaseDecorator
  include OrderExtensions
  include Crichton::Representor::Factory

  decorates :orders

  def initialize(collection)
    @collection = collection.map { |obj| OrderDecorator.new(obj) }
    @object = yield @collection if block_given?
  end

  def value
    orders_collection = {
        total_count: collection.count,
        shipped_count: collection.select { |item| item.status == :shipped }.count,
        delivered_count: collection.select { |item| item.status == :delivered }.count,
        items: @object || collection,
        payment_methods: ->(options) { payment_methods(options) },
        method_on_target: ->() { method_on_target }
    }
    build_state_representor(orders_collection, :orders, {state: :collection})
  end

  def collection
    @collection
  end
end
