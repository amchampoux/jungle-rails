class User < ApplicationRecord

  has_secure_password

  validates :first_name, presence: { message: "must be given please" }
  # validates :last_name, presence: true
  # validates :email, presence: true
  # validates :password, presence: true
  # validates :password_confirmation, presence: true
  # validates :email { case_sensitive: true }

  
end



