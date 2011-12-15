class RemoveDateToGames < ActiveRecord::Migration
  def self.up
    remove_column :games, :date
    
  end

  def self.down
    add_column :games, :date, :integer
    
  end
end
