class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.references :games
      t.integer :userto
      t.integer :userfrom
      t.boolean :accepted

      t.timestamps
    end
  end
end
