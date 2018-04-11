class AddDetailToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :detail, :text
  end
end
