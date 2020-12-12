class OrdersController < APIBaseController
  authorize_resource
  before_action :auth_user, :load_cart

  def index
    orders = current_customer.orders
    if orders.empty?
      render json: {}, status: 204
    else
      render json: orders
    end
  end

  def show
    @order = Order.find(params[:id])
    render json: @order.to_json(include: {
                                  products: {}
                                })
  end
  
  def create
    unless @cart.products.empty?
      @order = Order.new(
        value: @cart.value,
        user_id: current_customer.id
      )
      @order.products << @cart.products
      @cart.products.delete_all
      @cart.value = 0
      @order.save
      @cart.save
      render json: @order.to_json(include: {
                                    products: {}
                                  })
    else
      render json:{"cart": "empty"}, status: 400
    end
  end
  
  private
  
  def load_cart
    @cart = current_customer.cart
  end
end
