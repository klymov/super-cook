class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.float   :price
      t.string  :name
      t.string  :description
      t.integer :productiontime
      t.boolean :real
      t.float   :weight
      t.string  :type_of_holiday
      t.timestamps
    end
    add_index :items, :name
    add_index :items, :price
    add_index :items, :type_of_holiday
  end
end
