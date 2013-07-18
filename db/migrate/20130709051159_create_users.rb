class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password
      t.string :utype
      t.string :ustatus
      t.string :last_login_ip
      t.datetime :last_login_at
      t.references :organization, index: true

      t.timestamps
    end
  end
end
