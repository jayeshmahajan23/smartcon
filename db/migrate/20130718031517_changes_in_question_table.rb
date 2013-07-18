class ChangesInQuestionTable < ActiveRecord::Migration
  def change
  	change_column :questions, :ans_1, :text
	change_column :questions, :ans_2, :text
	change_column :questions, :ans_3, :text
	change_column :questions, :ans_4, :text
	change_column :questions, :ans_5, :text
	change_column :questions, :ans_6, :text
	change_column :questions, :ans_7, :text
	change_column :questions, :ans_8, :text
	change_column :questions, :ans_9, :text
	change_column :questions, :ans_10, :text
  end
end