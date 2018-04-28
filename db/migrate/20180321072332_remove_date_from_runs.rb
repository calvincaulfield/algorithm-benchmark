class RemoveDateFromRuns < ActiveRecord::Migration[5.1]
  def change
    remove_column :runs, :date, :date
  end
end
