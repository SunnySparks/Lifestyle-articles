class CreateArtcategos < ActiveRecord::Migration[5.2]
  def change
    create_table :artcategos do |t|
      t.bigint :article_id
      t.bigint :category_id

      t.timestamps
    end
  end
end
