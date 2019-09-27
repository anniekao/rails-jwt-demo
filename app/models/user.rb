class User < ApplicationRecord
  has_secure_password
  before_save :downcase_email

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password,
            length: { minimum: 6 },
            if: -> { new_record? || !password.nil? }

  def downcase_email
    self.email = self.email.delete(' ').downcase
  end

end
