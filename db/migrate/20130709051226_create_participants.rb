class CreateParticipants < ActiveRecord::Migration
  def change
    create_table :participants do |t|
      t.integer :contest_id
      t.integer :twitter_user_id
      t.string :ip
      t.string :country
      t.string :state
      t.string :browser
      t.integer :num_of_q_answered
      t.boolean :has_tweeted
      t.boolean :posted_on_fb
      t.string :pstatus
      t.boolean :is_winner
      t.string :winner_tag
      t.string :winner_note
      t.datetime :winner_at
      t.references :twitter_user, index: true
      t.references :contest, index: true
      t.string :referrer
      t.boolean :multiple_entered

      t.timestamps
    end
  end
end
