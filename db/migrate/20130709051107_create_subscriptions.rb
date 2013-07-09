class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.string :detail
      t.float :amount
      t.string :sstatus
      t.string :stype

      t.timestamps
    end
  end
end
