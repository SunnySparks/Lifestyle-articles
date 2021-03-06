class Article < ApplicationRecord
  validates :avatar, attached: true
  validates :title, presence: true, length: { minimum: 3, maximum: 30 }
  validates :text, presence: true, length: { minimum: 10, maximum: 225 }
  validates :user_id, presence: true
  validates :category_id, presence: true

  belongs_to :user
  has_many :categories
  acts_as_votable
  has_one_attached :avatar

  def score
    votes.count
  end

  def self.highest_voted
    self.order('cached_votes_up DESC')
  end
end
