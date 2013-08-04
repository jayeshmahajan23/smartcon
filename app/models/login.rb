class Login
  include ActiveModel::Model

  attr_accessor :email, :password, :remember

  def initialize attributes = {}
    attributes.each { |k, v| send("#{k}=", v) }
  end

  def authenticate
    if u = User.find_by(email: self.email.downcase)
      return u if u.correct_password?(self.password)
    end
    false
  end

  def persist
    @persisted = true
  end

  def persisted?
    @persisted
  end

end