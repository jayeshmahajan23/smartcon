class ChangesInContestTable < ActiveRecord::Migration
  def change
  	change_column :contests, :accept_multiple, :boolean
  	change_column :contests, :prize_detail, :text
  	change_column :contests, :over_message, :text
  	change_column :contests, :answer_filter, :text
  end
end