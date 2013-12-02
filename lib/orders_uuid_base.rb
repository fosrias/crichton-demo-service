class OrdersUuidBase < ActiveRecord::Base
  self.primary_key = :uuid
  self.table_name = :orders
  attr_accessible :uuid, :name, :quantity, :address, :email, :placed_on, :status, :express

  before_create :generate_defaults

  def to_key
    [uuid]
  end

  def generate_defaults
    self.uuid = SecureRandom.uuid
    self.status ||= 'placed'
    self.placed_on = Time.now
    self.express = 0
  end
end