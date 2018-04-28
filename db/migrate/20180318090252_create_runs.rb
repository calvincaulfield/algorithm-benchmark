class CreateRuns < ActiveRecord::Migration[5.1]
  def change
    create_table :runs do |t|
      t.string 'title'
      t.date 'date'
      t.string 'env'
      t.string 'tags', array: true
      t.jsonb 'data'
      t.timestamps
    end
  end
end
