class AddIndexToRuns < ActiveRecord::Migration[5.1]
  def change
    add_index :runs, :datetime, unique: true
  end
end
