class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true, length: { maximum: 40 }
  validates :priority, presence: true, inclusion: 1..5

  has_many :articles, dependent: :destroy

  scope :for_navbar, -> { limit(5) }

  def first_article
    articles.includes(:avatar_attachment).order(created_at: :desc).first
  end
end
