class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user
  acts_as_votable :vote_counter => true
  has_one_attached :avatar

  def score
    votes.count
  end
end
