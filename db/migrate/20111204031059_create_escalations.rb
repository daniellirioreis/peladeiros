class CreateEscalations < ActiveRecord::Migration
  def self.up
    create_table :escalations do |t|
      t.integer :user_id
      t.integer :game_id

      t.timestamps
    end
  end

  def self.down
    drop_table :escalations
  end
end
