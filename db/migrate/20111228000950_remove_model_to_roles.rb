class RemoveModelToRoles < ActiveRecord::Migration
  def self.up
    remove_column :roles, :model
  end

  def self.down
    add_column :roles, :model, :string
    
  end
end
