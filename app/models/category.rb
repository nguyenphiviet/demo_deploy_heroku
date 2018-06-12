class Category < ApplicationRecord
  has_many :dishes

  scope :ordered_by_name, ->(keyword = :asc){order name: keyword}
end
