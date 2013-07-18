class ChangesInUpdateTable < ActiveRecord::Migration
  def change
  	change_column :updates, :message, :text
  end
end