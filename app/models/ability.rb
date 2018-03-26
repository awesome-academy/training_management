class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
      cannot :destroy, User do |user|
        user.admin?
      end
    else
      can :read, :all
      can :update, User, id: user.id
      can :read, UserCourse, user_id: user.id
      can [:update, :read], User, user_id: user.id
    end
  end
end
