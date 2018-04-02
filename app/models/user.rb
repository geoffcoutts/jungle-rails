class User < ActiveRecord::Base
  has_secure_password

  validates_length_of :password, in: 8..16
  validates_confirmation_of :password
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :first_name, presence: true
  validates :last_name, presence: true
  # before_save :downcase_email

  # def downcase_email
  #   self.email.downcase!
  # end

  def self.authenticate_with_credentials(email, password)
    email.gsub!(/\A\p{Space}*|\p{Space}*\z/, '')

    user = User.where('lower(email) = ?', email.downcase).first
    if user
      user.authenticate(password)
    else
      false
    end
  end
end
