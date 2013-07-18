class ChangesInAnswerTable < ActiveRecord::Migration
  def change
  	change_column :answers, :answers, :text
  	rename_column :answers, :answers, :answer
  end
end