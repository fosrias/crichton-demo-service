class AddAdditionalFields < ActiveRecord::Migration
  def change
      add_column :drds, :size, :string
      add_column :drds, :location, :string
  end
end
