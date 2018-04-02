class User < ActiveRecord::Base
  has_secure_password

  validates_confirmation_of :password
  validates :password_confirmation, presence: true
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
