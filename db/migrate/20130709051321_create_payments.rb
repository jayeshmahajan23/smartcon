class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.float :amount_paid
      t.integer :plan_id
      t.integer :quantity
      t.float :amount_returned
      t.float :total_to_pay
      t.float :discount
      t.string :gateway_id
      t.string :payment_meta_data
      t.string :comment
      t.string :pstatus
      t.references :organization, index: true
      t.references :coupon, index: true

      t.timestamps
    end
  end
end
