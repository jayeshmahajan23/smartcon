class Organization < ActiveRecord::Base
  belongs_to :subscription
  has_many :users
end