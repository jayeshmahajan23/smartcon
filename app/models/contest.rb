class Contest < ActiveRecord::Base
  belongs_to :organization
  belongs_to :theme
end
