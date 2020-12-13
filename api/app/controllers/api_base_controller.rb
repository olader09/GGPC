class APIBaseController < ActionController::API
  include Knock::Authenticable
  def current_ability
    @current_ability ||= if current_admin.present?
                          Ability.new(current_admin)
                         else
                          Ability.new(current_customer)
                         end
  end

  protected

  def auth_user
    if current_admin.present?
      authenticate_admin
    else
      authenticate_customer
    end
  end
  
end
