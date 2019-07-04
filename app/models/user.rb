class User < ApplicationRecord
  before_save{downcase_email}
  validates :name, presence: true,
  length: {maximum: Settings.user.validates.max_name_length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
  length: {maximum: Settings.user.validates.max_email_length},
  format: {with: VALID_EMAIL_REGEX},
  uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true,
  length: {minimum: Settings.user.validates.min_pass_length}

  private
  def downcase_email
    email.downcase!
  end
end