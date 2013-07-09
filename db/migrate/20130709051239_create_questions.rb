class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.integer :qorder
      t.string :qtype
      t.boolean :must_answer
      t.string :ans_1
      t.string :ans_2
      t.string :ans_3
      t.string :ans_4
      t.string :ans_5
      t.string :ans_6
      t.string :ans_7
      t.string :ans_8
      t.string :ans_9
      t.string :ans_10
      t.references :contest, index: true

      t.timestamps
    end
  end
end
