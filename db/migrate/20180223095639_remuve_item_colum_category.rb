class RemuveItemColumCategory < ActiveRecord::Migration[5.1]
  def up

    remove_column :items, :category

  end
end
