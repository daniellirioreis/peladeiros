class AddNumberMembersToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :number_members, :integer
  end

  def self.down
    remove_column :companies, :number_members
  end
end
