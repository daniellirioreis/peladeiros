class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.integer :user_from_id
      t.integer :user_to_id
      t.integer :message_from_id
      t.text :text

      t.timestamps
    end
  end

  def self.down
    drop_table :messages
  end
end
