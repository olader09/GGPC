class APIBaseController < ActionController::API
  include Knock::Authenticable
  def current_ability
    @current_ability ||= Ability.new(current_customer)
  end

  protected

  def auth_user
    authenticate_customer
  end
end
