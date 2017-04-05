class CreateTournaments < ActiveRecord::Migration[5.0]
  def change
    create_table :tournaments do |t|
      t.string :title
      t.integer :number_of_participants
      t.date :date_start
      t.date :date_end
      t.string :city
      t.integer :number_of_rounds

      t.timestamps
    end
  end
end
