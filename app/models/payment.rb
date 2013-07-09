class Payment < ActiveRecord::Base
  belongs_to :organization
  belongs_to :coupon
end
