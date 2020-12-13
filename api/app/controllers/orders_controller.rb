class OrdersController < APIBaseController
  authorize_resource
  before_action :auth_user, :load_cart

  def index
    unless current_admin.present?
      orders = current_customer.orders
      if orders.empty?
        render status: 204
      else
        render json: orders
      end
    else
      orders = Order.all.order(id: :desc)
      if orders.empty?
        render status: 204
      else
        render json: orders
      end
    end
  end

  def show
    @order = Order.find(params[:id])
    render json: @order.to_json(include: {
                                  orders_products: {only: %i[quantity],
                                    include:{
                                      product:{}
                                    }}
                                })
  end
  
  def create
    unless @cart.products.empty?
      @order = Order.new(
        value: @cart.value,
        quantity: @cart.quantity,
        customer_id: current_customer.id
      )
      @cart.carts_products.each do |carts_product|
        @order.orders_products.new(product: carts_product.product, quantity: carts_product.quantity).save
      end
      @cart.products.delete_all
      @cart.value = 0
      @cart.quantity = 0
      @order.save
      @cart.save
      render json: @order.to_json(include: {
                                    orders_products: {only: %i[quantity],
                                      include:{
                                        product:{}
                                      }}
                                  })
    else
      render json:{"cart": "empty"}, status: 400
    end
  end

  def confirm
    order = Order.find(params[:id])
    order.update(confirmed: true)
    render json: order.to_json(include: {
                                orders_products: {only: %i[quantity],
                                  include:{
                                    product:{}
                                  }}
                              })
  end
  
  private
  
  def load_cart
    @cart = current_customer.cart if current_customer.present?
  end
end
