class CustomersController < APIBaseController
  before_action :auth_user, :load_customer, except: %i[create]
  authorize_resource except: %i[create]

  def show
    render json: @customer.to_json(except: %i[password_digest])
  end

  def update
    @customer.update(update_customer_params)
    if @customer.errors.blank?
      render status: :ok
    else
      render json: @customer.errors, status: :bad_request
    end
  end

  def create
    @customer = Customer.create(create_customer_params)
    if @customer.errors.blank?
      render json: @customer, except: %i[password_digest], status: :ok
    else
      render json: @customer.errors, status: :bad_request
    end
  end

  protected

  def load_customer
    @customer = current_customer
  end

  def default_customer_fields
    %i[name city address zip region]
  end

  def update_customer_params
    params.required(:customer).permit(
      *default_customer_fields, :password
    )
  end

  def create_customer_params
    params.required(:customer).permit(
      *default_customer_fields, :email, :password
    )
  end
end
