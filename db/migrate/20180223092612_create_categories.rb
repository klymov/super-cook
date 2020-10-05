class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name_category
      t.timestamps
    end

    add_column :items, :category_id, :integer

  end
end
