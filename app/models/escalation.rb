# encoding: utf-8
class Escalation < ActiveRecord::Base

  belongs_to :game, :class_name => "Game", :foreign_key => "game_id"
  belongs_to :user, :class_name => "User", :foreign_key => "user_id"  
  validates_uniqueness_of :user_id, :scope => :game_id, :message => "sua presença já foi confirmada neste jogo"
  
  def to_s
    user if user.present?
  end
  
  def date
    game.day if game.present?
  end
end