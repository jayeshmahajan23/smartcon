class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :code
      t.integer :organization_id
      t.string :comment
      t.string :ctype
      t.datetime :expire_at
      t.string :discount_method

      t.timestamps
    end
  end
end
