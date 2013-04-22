class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.moderator?
      can :update, User do |u|
        user.prev >= u.prev
      end

      can :create, Announce

      can :read, Announce do |n|
        user.prev >= n.prev
      end

      can :manage, Announce do |n|
        user == n.user
      end

      can :use, Chat
    elsif user.user?
      can :read, User
      
      can :read, Announce do |n|
        user.prev >= n.prev
      end

      can :update, User do |u|
        user == u
      end

      can :use, Chat
    else
      can :read, Announce do |n|
        user.prev >= n.prev
      end
    end
  end
end
