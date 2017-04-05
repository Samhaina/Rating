class CreateResults < ActiveRecord::Migration[5.0]
  def change
    create_table :results do |t|
      t.integer :player_id
      t.integer :tournament_id
      t.integer :place

      t.timestamps
    end
  end
end
