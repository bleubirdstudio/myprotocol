class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    else
      unless user.new_record?
        can [:edit, :update, :read], Profile, user_id: user.id unless current_user.profile.nil?
        can [:edit, :update], Coach, user_id: user.id unless current_user.coach.nil?
      end
      can :read, Coach
    end
  end
end
