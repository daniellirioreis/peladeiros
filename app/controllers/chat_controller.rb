# encoding: utf-8
class ChatController < ApplicationController

  def index
    @companies_users = []
    current_company.companies_users.each do |company_user|
      unless company_user.user_id == current_user.id
        @companies_users  << company_user 
      end
    end
  end

end