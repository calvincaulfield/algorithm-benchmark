class AddDesc3ToCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :categories, :desc3, :text
  end
end
