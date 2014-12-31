class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      unless user.new_record?
        can [:edit, :update, :read], Profile, user_id: user.id unless user.profile.nil?
        can [:edit, :update], Coach, user_id: user.id unless user.coach.nil?
      end
      if user.coach.nil?
        can :create, Coach
      end
      if user.profile.nil?
        can :create, Profile
      end
      if user.gym.nil?
        can :create, Gym
      end
      can :read, Coach
      can :read, Gym
    end
  end
end
