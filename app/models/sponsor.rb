class Sponsor < ApplicationRecord
  validates :company_name, :representative_name, :email, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end