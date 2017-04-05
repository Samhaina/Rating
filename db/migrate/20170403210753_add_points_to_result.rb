class AddPointsToResult < ActiveRecord::Migration[5.0]
  def change
    add_column :results, :points, :float
  end
end
