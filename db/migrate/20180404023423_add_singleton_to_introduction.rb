class AddSingletonToIntroduction < ActiveRecord::Migration[5.1]
  def change
    add_column :introductions, :singleton, :decimal
  end
end
