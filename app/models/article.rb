class Article < ApplicationRecord
  validates :user_id, :title, :text, presence: true
  validates :title, length: { minimum: 3 }
  validates :text, length: { minimum: 3 }

  belongs_to :user, class_name: 'User', foreign_key: 'user_id'
  #  has_one_attached :avatar
  #  has_many :artcats, dependent: :destroy
  #  has_many :categories, through: :artcats
  #  belongs_to :categories
  has_many :votes
  has_many :voters, through: :votes, class_name: 'User'

  #  scope :get_most_votes, -> { joins(:votes).group('articles.id').order('count(votes.id) desc').first }
end
