class User < ApplicationRecord

  has_secure_password

  validates :first_name, presence: { message: "must be given" }
  validates :last_name, presence: { message: "must be given" }
  validates :email, uniqueness: true, presence: { message: "must be given" }
  validates :password_confirmation, presence: { message: "must be given" }
  validates :password, length: { minimum: 5 }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email)

    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end

end


