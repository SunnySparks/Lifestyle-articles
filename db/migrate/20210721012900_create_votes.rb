class CreateVotes < ActiveRecord::Migration[5.2]
  def change
    create_table :votes do |t|
      t.integer :User_id
      t.integer :Article_id

      t.timestamps
    end
  end
end
