require 'crichton/representor/factory'
require 'drds_extensions'

class DrdsDecorator < BaseDecorator
  include DrdsExtensions
  include Crichton::Representor::Factory

  decorates :drds

  def initialize(collection)
    @collection = collection.map { |obj| DrdDecorator.new(obj) }
    @object = yield @collection if block_given?
  end

  def value
    drds_collection = {
      total_count: collection.count,
      items: @object || collection,
      location_options: ->(options) { location_options(options) }
    }
    build_state_representor(drds_collection, :drds, {state: :collection})
  end

  def collection
    @collection
  end
end