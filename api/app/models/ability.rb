class Ability
  include CanCan::Ability

  def initialize(user)
    alias_action :create, :read, :update, :destroy, to: :crud

    user ||= Customer.new

    if user&.class == Customer
      can :manage, Customer, id: customer.id
      can :read, Product
      can :read, Delivery
      can :manage, Cart, customer_id: customer.id
      can :manage, Order, customer_id: customer.id
    end
  end
end
