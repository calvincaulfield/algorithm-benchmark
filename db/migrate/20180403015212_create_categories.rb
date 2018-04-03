class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :desc
      t.text :comment

      t.timestamps
    end
  end
end
