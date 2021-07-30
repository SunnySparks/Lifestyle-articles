class Article < ApplicationRecord
  belongs_to :category
  belongs_to :user
  acts_as_votable

  def score
    votes.count
  end
end
