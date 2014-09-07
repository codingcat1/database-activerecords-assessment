class AddDisqualifiedToCompetitors < ActiveRecord::Migration
  def change
    add_column :competitors, :disqualified, :boolean
  end
end
