class AddDateToGame < ActiveRecord::Migration
  def change
  	change_table(:games) do |t|
  		t.datetime :date
    end

  end
end
