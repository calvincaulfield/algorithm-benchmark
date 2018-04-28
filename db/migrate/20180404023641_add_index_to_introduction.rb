class AddIndexToIntroduction < ActiveRecord::Migration[5.1]
  def change
    add_index :introductions, :singleton, unique: true
  end
end
