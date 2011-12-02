class AddCompanyDefaultIdToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :company_default_id, :integer
  end

  def self.down
    remove_column :users, :company_default_id
  end
end
