class CreateAccounts < ActiveRecord::Migration
  def self.up
    create_table :accounts do |t|
      t.integer :company_user_id
      t.integer :month
      t.integer :year
      t.float :price
      t.text :description
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :accounts
  end
end
