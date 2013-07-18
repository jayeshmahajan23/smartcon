class CreateThemes < ActiveRecord::Migration
  def change
    create_table :themes do |t|
      t.string :name
      t.string :folder
      t.integer :organization_id
      t.string :tstatus
      t.string :ttype

      t.timestamps
    end
  end
end
