class Answer < ActiveRecord::Base
  belongs_to :participant
  belongs_to :question
end
