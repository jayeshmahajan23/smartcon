class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :answers
      t.references :participant, index: true
      t.references :question, index: true

      t.timestamps
    end
  end
end
