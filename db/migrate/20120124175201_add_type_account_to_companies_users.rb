class AddTypeAccountToCompaniesUsers < ActiveRecord::Migration
  def self.up
    add_column :companies_users, :type_account, :integer, :default => 0
  end

  def self.down
    remove_column :companies_users, :type_account
  end
end
