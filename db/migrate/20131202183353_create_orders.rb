class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders, :id => false do |t|
      t.string :uuid
      t.string :name
      t.string :quantity
      t.string :email
      t.string :address
      t.datetime :placed_on
      t.string :status
      t.boolean :express
    end
  end
end
