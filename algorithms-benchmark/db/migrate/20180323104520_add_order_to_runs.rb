class AddOrderToRuns < ActiveRecord::Migration[5.1]
  def change
    add_column :runs, :order, :decimal
  end
end
