class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.moderator?
      can :update, User
    elsif user.guest?
      
    else
      can :read, User
    end
  end
end
