class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.integer :views
      t.integer :pcount
      t.datetime :time_at
      t.references :contest, index: true

      t.timestamps
    end
  end
end
