class User < ActiveRecord::Base
  belongs_to :organization

  def lower_email
    self.email.downcase!
  end

  def unique_email?
    lower_email
    !User.where('lower(email) = ? and ustatus != ?', self.email, 'delete').any?
  end

end
