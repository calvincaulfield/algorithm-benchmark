class AddDesc2ToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :desc2, :text
  end
end
