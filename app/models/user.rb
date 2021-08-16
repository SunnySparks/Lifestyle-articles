class User < ApplicationRecord
  validates :name, uniqueness: true, presence: true, length: { minimum: 3, maximum: 30 }

  has_many :articles
  has_many :votes
end
