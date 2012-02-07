class CreateCompaniesUsers < ActiveRecord::Migration

  def self.up
    create_table :companies_users do |t|
      t.integer :company_id
      t.integer :user_id
    end

  end

  def self.down
    drop_table :companies_users
  end

end
