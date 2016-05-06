class CreateChampionMasteries < ActiveRecord::Migration[5.0]
  def change
    create_table :champion_masteries do |t|
      t.integer :champion
      t.integer :points
      t.integer :level

      t.timestamps
    end
  end
end
