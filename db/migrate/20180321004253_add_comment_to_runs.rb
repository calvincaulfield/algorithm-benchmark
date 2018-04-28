class AddCommentToRuns < ActiveRecord::Migration[5.1]
  def change
    add_column :runs, :comment, :string
  end
end
