class RenameDescToDefinitionInCategory < ActiveRecord::Migration[5.1]
  def change
    rename_column :categories, :desc, :definition
    rename_column :categories, :desc2, :description
    rename_column :categories, :desc3, :complexity
    rename_column :categories, :comment, :performance
  end
end
