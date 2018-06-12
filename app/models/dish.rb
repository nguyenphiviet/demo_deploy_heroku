class Dish < ApplicationRecord
  belongs_to :category
  has_many :images
  has_many :booking_details
  has_many :ratings
  has_many :reviews
  scope :lastest, ->(number){order(created_at: :desc).limit(number).select(:id, :name, :price)}
  def self.most_popular_dishes
    dish_ids = "SELECT `booking_details`.`dish_id`
                FROM booking_details
                GROUP BY `booking_details`.`dish_id`
                ORDER BY sum(booking_details.quantity) DESC"
    Dish.where(id: dish_ids).select(:id, :name, :price).limit(Settings.home.dish_popular_number)
  end
end
