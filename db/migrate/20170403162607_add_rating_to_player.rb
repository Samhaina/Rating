class AddRatingToPlayer < ActiveRecord::Migration[5.0]
  def change
    add_column :players, :rating, :float
    add_column :players, :vnovikov_rating, :float
  end
end
