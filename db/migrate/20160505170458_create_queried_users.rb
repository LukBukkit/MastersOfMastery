class CreateQueriedUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :queried_users do |t|
      t.integer :leagueid
      t.string :name
      t.string :elo

      t.timestamps
    end
  end
end
