class AddQuantityItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :quantity, :string
  end
end
