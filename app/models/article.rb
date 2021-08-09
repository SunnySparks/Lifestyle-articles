class Article < ApplicationRecord
  has_many :categories
  belongs_to :user
  acts_as_votable
  has_one_attached :avatar
  validates :avatar, attached: true

  def score
    votes.count
  end

  def self.highest_voted
    self.order('cached_votes_up DESC')
  end
end
