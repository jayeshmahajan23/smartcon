class Participant < ActiveRecord::Base
  belongs_to :twitter_user
  belongs_to :contest
end
