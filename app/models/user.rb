class User < ApplicationRecord
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  VALID_PASSWORD_REGEX = /\A(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[0-9])(?=.*[a-z]).{6,}\z/
  validates :password, presence: true, 
                       confirmation: { case_sensitive: false },
                       unless: Proc.new { |a| a.password.blank? },
                       format: { with: VALID_PASSWORD_REGEX, 
                                 message: "must contain upper, lower, number, and a special character" },
                       length: { minimum: 6 }

end
