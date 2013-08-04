class Signup
  include ActiveModel::Model

  attr_accessor :name, :email, :password, :company, :time_zone
  validates :name, presence: true, alpha_numeric: true
  validates :email, email_format: true
  validates :time_zone, presence: true
  validates :password, length: { in: 6..12 }
  validates :company, presence: true, length: { maximum: 100 }
  validates_acceptance_of :terms_of_service

  def initialize attributes = {}
    attributes.each { |k, v| send("#{k}=", v) }
  end

  def persist
    @persisted = true
  end

  def persisted?
    @persisted
  end

  def save utype = 'admin', otype = 'basic'
    o = Organization.new name: self.company, otype: otype, ostatus: 'active'
    if o.valid? && o.save
      u = User.new(
        name: self.name,
        password: self.password,
        email: self.email,
        organization_id: o.id,
        ustatus: 'active',
        utype: utype,
        time_zone: self.time_zone
      )
      if !u.unique_email?
        errors.add :email, :unique_email_html
      elsif u.valid? && u.register
        self.send_welcome_email self.email
        return true
      end
      # Destroy the organization to rollback
      o.delete
    end
    false
  end

  def send_welcome_email email
    #send email here
  end

end