class CreateLevels < ActiveRecord::Migration
  def change
    create_table :levels do |t|
      # t.integer :points, :limit => 16
      t.column :points, :bigint


      t.timestamps
    end
  end
end
