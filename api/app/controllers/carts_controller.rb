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
    if @cart.products.include?(product)
      carts_product = @cart.carts_products.find_by(product: product)
      carts_product.quantity += 1
      carts_product.save
    else
      @cart.products << product
    end
    @cart.quantity += 1
    @cart.value += product.price
    @cart.save
    render json: @cart.to_json(include: {
                                carts_products: { only: %i[quantity],
                                include:{
                                  product:{}
                                }},
                              })
  end


  protected
  def load_cart
    @cart = current_customer.cart
  end
  
end
