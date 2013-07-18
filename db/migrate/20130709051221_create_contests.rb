class CreateContests < ActiveRecord::Migration
  def change
    create_table :contests do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.string :cstatus
      t.string :ctype
      t.string :name
      t.string :headine
      t.string :banner_path
      t.string :background_path
      t.integer :theme_id
      t.boolean :only_follwers
      t.string :owner_screen_name
      t.string :owner_twitter_token
      t.string :owner_twitter_secret
      t.string :owner_facebook_id
      t.string :owner_facebook_token
      t.string :owner_facebook_secret
      t.integer :min_followers_count
      t.datetime :min_twitter_start_date
      t.integer :min_status_count
      t.string :message_to_tweet
      t.string :message_to_fb
      t.boolean :tweet_required
      t.boolean :fb_required
      t.integer :max_entries
      t.string :accept_multiple
      t.string :rules
      t.string :timezone
      t.float :prize_worth
      t.string :prize_currency
      t.string :prize_detail
      t.string :language
      t.boolean :show_winners
      t.boolean :show_winner_answer
      t.string :over_message
      t.string :send_email_to
      t.string :completion_msg
      t.references :organization, index: true
      t.integer :user_id
      t.string :deleted_user_name
      t.references :theme, index: true
      t.string :answer_filter

      t.timestamps
    end
  end
end
