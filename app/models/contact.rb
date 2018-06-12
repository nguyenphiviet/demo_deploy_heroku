class Contact < ApplicationRecord
  validates :first_name, presence: true,
    length: {maximum: Settings.contact.max_length}
  validates :last_name, presence: true,
    length: {maximum: Settings.contact.max_length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.contact.max_length},
    format: {with: VALID_EMAIL_REGEX}
  validates :subject, length: {maximum: Settings.contact.subject.max_length}
  validates :message, length: {maximum: Settings.contact.message.max_length}
end
