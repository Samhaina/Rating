class AddPlayerTournamentRatingToResult < ActiveRecord::Migration[5.0]
  def change
    add_column :results, :player_tournament_rating, :float
  end
end
