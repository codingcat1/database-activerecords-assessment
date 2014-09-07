class ChangeCompetitionToEvents < ActiveRecord::Migration
  def change
    rename_table :competitions, :events
  end
end
