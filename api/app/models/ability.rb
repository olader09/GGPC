class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    user ||= Customer.new

    if user&.class == Customer
      can :manage, Customer, id: user.id
      can :read, Product
      can :read, Delivery
      can :manage, Cart, customer_id: user.id
      can :manage, Order, customer_id: user.id
    end
  end
end
