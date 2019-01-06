class RenameColumnsInItems < ActiveRecord::Migration[5.0]
  def change
    rename_column :items, :real, :available
    rename_column :items, :type_of_holiday, :category
  end
end
