class ContactMe < ApplicationRecord
  validates :name, :message, presence: true
  validates :email, email: true
end
