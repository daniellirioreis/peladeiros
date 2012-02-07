class Message < ActiveRecord::Base
  belongs_to :user_from, :class_name => "User", :foreign_key => "user_from_id"
  
  scope :user_from_id_or_user_to_id, lambda{ |user_from_id, user_to_id| where("user_from_id = ? or user_to_id = ?", user_from_id, user_to_id)}
  
end
