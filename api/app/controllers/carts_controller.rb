class CartsController < APIBaseController
  authorize_resource
  before_action :auth_user, :load_cart

  def show
    render json: @cart.to_json(include: {
                                  products: {}
                                })
  end

  def add
    product = Product.find(params[:id])
    @cart.products << product
    @cart.update(value: @cart.value + product.value)
    render json: @cart.to_json(include: {
                                products: {}
                              })
  end


  protected
  def load_cart
    @cart = current_customer.cart
  end
  
end
