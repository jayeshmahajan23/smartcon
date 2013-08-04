class User < ActiveRecord::Base
  validates :name, presence: true, alpha_numeric: true
  validates :time_zone, presence: true
  validates :email, email_format: true
  validates :password, presence: true
  validates :organization_id, presence: true

  belongs_to :organization
  before_save :lower_email
  before_update :lower_email

  def correct_password? pass
    encrypt(pass) == self.password
  end

  # Don't use create method
  def create
    false
  end

  def lower_email
    self.email.downcase! if self.email
  end

  def register
    encrypt_password
    save
  end

  def unique_email?
    lower_email
    !User.where('lower(email) = ? and ustatus != ?', self.email, 'delete').any?
  end

  def update_login_records ip
    update last_login_ip: ip, last_login_at: Time.now.utc.to_s
  end

  private
    def encrypt pass
      Digest::SHA1.hexdigest pass
    end

    def encrypt_password
      self.password = encrypt self.password.to_s if self.password
    end


end
