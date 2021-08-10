class Article < ApplicationRecord
  validates :avatar, attached: true
  validates :title, length: { minimum: 3, maximum: 20 }
  validates :text, length: { minimum: 10, maximum: 225 }

  has_many :categories
  belongs_to :user
  acts_as_votable
  has_one_attached :avatar

  def score
    votes.count
  end

  def self.highest_voted
    self.order('cached_votes_up DESC')
  end
end
