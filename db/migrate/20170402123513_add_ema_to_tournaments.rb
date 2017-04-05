class AddEmaToTournaments < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :ema, :integer
  end
end
