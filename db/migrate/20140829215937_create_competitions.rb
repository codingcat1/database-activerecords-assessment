class CreateCompetitions < ActiveRecord::Migration
  def change
    create_table :competitions do |t|
      t.integer :competitor_id
      t.integer :game_id

      t.timestamps
    end
  end
end
