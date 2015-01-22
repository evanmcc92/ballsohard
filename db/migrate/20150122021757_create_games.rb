class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :user, index: true
      t.string :venue
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.references :sport, index: true
      t.string :notes
      t.integer :points
      t.boolean :public
      t.integer :playercount
      t.string :experience

      t.timestamps
    end
  end
end
