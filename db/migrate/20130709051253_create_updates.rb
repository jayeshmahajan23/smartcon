class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :message
      t.string :utype
      t.references :contest, index: true

      t.timestamps
    end
  end
end
