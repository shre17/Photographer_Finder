class Comment < ApplicationRecord
  belongs_to :users, optional: true
  belongs_to :articles, optional: true
end
