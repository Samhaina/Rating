class AddCoeffToTournament < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :k_sum, :float
    add_column :tournaments, :k_fading, :float
  end
end
