class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :search, :to => :read

    user.roles.each do |role|
      can role.action.to_sym, role.controller
    end
  end
end
