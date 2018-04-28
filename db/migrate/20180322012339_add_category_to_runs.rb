class AddCategoryToRuns < ActiveRecord::Migration[5.1]
  def change
    add_column :runs, :category, :string
    add_column :runs, :sub_category, :string
  end
end
