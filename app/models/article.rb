class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :votes
end
