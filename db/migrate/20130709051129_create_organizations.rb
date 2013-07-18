class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :country
      t.string :otype
      t.string :ostatus
      t.integer :premium_contest_count
      t.integer :sub_premium_contest_count
      t.datetime :subscription_starts_at
      t.datetime :subscription_expires_at
      t.references :subscription, index: true

      t.timestamps
    end
  end
end
