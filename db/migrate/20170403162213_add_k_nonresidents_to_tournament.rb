class AddKNonresidentsToTournament < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :k_nonresidents, :float
  end
end
