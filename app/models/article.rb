class Article < ApplicationRecord
  belongs_to :photographers, optional: true
  has_many :comments, dependent: :destroy
end
