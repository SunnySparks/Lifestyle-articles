class Article < ApplicationRecord
  belongs_to :category, dependent: :destroy
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
