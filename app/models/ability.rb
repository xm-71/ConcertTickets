class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :customer
      can :index, :all
      can :manage, User, :id => user.id
      can :index, Concert
      can :show, Concert
      can :show, Venue
          else
      can :index, :all
      can :create, User
  end
end
end
