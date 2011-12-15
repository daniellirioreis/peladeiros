class CreateCalendars < ActiveRecord::Migration
  def self.up
    create_table :calendars do |t|
      t.integer :company_id
      t.date :date_start
      t.date :date_end

      t.timestamps
    end
  end

  def self.down
    drop_table :calendars
  end
end
