class AddNumberOfDaysToTournaments < ActiveRecord::Migration[5.0]
  def change
    add_column :tournaments, :number_of_days, :integer
  end
end
