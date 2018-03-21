class AddDatetimeToRuns < ActiveRecord::Migration[5.1]
  def change
    add_column :runs, :datetime, :datetime
  end
end
