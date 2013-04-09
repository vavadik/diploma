class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.moderator?
      can :update, User

      can :create, Announce

      can :read, Announce do |n|
        user.prev >= n.prev
      end

      can :manage, Announce do |n|
        user == n.user
      end
    elsif user.user?
      can :read, User
      
      can :read, Announce do |n|
        user.prev >= n.prev
      end
    else
      can :read, Announce do |n|
        user.prev >= n.prev
      end
    end
  end
end
