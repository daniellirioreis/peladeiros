# encoding: utf-8
class MessagesController < ApplicationController

  def index
    @user = User.find(params[:user_id])    
    @messages = Message.user_from_id_or_user_to_id(current_user.id, current_user.id)
    @message = Message.new
    
    respond_to do |format|
      format.html # index.html.erb
      format.js
    end
    
  end

  def create
    @message = Message.new(params[:message])

    respond_to do |format|
      if @message.save
        format.html { redirect_to(messages_path(:user_id =>@message.user_to_id )) }
      end
    end
  end
  
end