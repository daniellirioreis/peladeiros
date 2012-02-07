class AddControllerToRoles < ActiveRecord::Migration
  def self.up
    add_column :roles, :controller, :string
  end

  def self.down
    remove_column :roles, :controller
  end
end
