class Album < ApplicationRecord
  belongs_to :photographers, optional: true
  has_many :images, as: :imageable, dependent: :destroy
  mount_uploader :image, ImageUploader
end
