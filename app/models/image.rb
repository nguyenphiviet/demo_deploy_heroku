class Image < ApplicationRecord
  belongs_to :dish

  mount_uploader :url, ImageUploader
end
