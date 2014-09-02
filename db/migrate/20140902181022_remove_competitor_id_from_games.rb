class RemoveCompetitorIdFromGames < ActiveRecord::Migration
  def change
    remove_column :games, :competitor_id, :integer
  end
end
