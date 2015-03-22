class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :games, index: true
      t.integer :user1
      t.integer :user2
      t.integer :user3
      t.integer :user4
      t.integer :user5
      t.integer :user6
      t.integer :user7
      t.integer :user8
      t.integer :user9
      t.integer :user10
      t.integer :user11
      t.integer :user12
      t.integer :user13
      t.integer :user14
      t.integer :user15
      t.integer :user16
      t.integer :user17
      t.integer :user18
      t.integer :user19
      t.integer :user20

      t.timestamps
    end
  end
end
