class AddDayIdToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :day_id, :integer
  end

  def self.down
    remove_column :games, :day_id
  end
end
