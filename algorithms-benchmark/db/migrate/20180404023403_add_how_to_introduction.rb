class AddHowToIntroduction < ActiveRecord::Migration[5.1]
  def change
    add_column :introductions, :how, :text
  end
end
