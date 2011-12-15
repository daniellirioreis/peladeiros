class CreateCalendarDays < ActiveRecord::Migration
  def self.up
    create_table :calendar_days do |t|
      t.integer :calendar_id
      t.date :date

      t.timestamps
    end
  end

  def self.down
    drop_table :calendar_days
  end
end
