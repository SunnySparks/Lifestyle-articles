class AddArticleIdToVotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :votes, :article, foreign_key: true
  end
end
