class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: [:google_oauth2, :facebook, :twitter]
  has_many :reviews, dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :bookings, dependent: :destroy
  before_save {self.email = email.downcase}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum:255},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}

  def self.from_omniauth access_token
    data = access_token.info
    user = User.where(email: data["email"]).first
    unless user
      user = User.new name: data["name"],
        email: data["email"], password: Devise.friendly_token[0,20]
      user.skip_confirmation!
      user.save
    end
    user
  end
end
