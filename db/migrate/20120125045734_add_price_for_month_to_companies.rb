class AddPriceForMonthToCompanies < ActiveRecord::Migration
  def self.up
    add_column :companies, :price_for_month, :float
  end

  def self.down
    remove_column :companies, :price_for_month
  end
end
