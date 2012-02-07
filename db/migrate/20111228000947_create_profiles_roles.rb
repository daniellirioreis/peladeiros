class CreateProfilesRoles < ActiveRecord::Migration

  def self.up
    create_table :profiles_roles, :id => false do |t|
      t.integer :profile_id, :null => false
      t.integer :role_id, :null => false
    end

  end

  def self.down
    drop_table :profiles_roles
  end

end
