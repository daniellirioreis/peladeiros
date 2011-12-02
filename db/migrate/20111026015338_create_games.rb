class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.integer :company_id
      t.string :name
      t.date :date
      t.time :hour_start
      t.time :hour_end
      t.integer :place
      t.integer :number_team
      t.integer :status
      t.integer :number_of_players_in_team
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
