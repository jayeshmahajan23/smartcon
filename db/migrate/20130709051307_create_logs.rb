class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.integer :some_id
      t.string :ltype
      t.string :detail
      t.string :ip_address
      t.references :user, index: true

      t.timestamps
    end
  end
end
