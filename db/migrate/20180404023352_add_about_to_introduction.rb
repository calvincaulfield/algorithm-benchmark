class AddAboutToIntroduction < ActiveRecord::Migration[5.1]
  def change
    add_column :introductions, :about, :text
  end
end
