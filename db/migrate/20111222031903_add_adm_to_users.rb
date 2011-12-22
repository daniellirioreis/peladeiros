class AddAdmToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :adm, :boolean, :default => false
  end

  def self.down
    remove_column :users, :adm
  end
end
