class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :article, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :article }
end
