class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, :all
    if user.admin? :admin
      can :manage, :all
    else
      can :manage, Comment, author_id: author.id
      can :manage, Post, author_id: author.id
      can :read, :all
    end
  end
end
