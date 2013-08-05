class Subscription < ActiveRecord::Base
  has_one :organization
end