class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :screen_name
      t.integer :num_of_followers
      t.integer :num_of_followings
      t.integer :num_of_statuses
      t.datetime :twitter_start_date
      t.string :avatar_url
      t.string :twitter_visibiity
      t.string :facebook_name
      t.boolean :update_it
      t.integer :klout_score
      t.integer :socont_score

      t.timestamps
    end
  end
end
