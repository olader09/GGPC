class CartsController < APIBaseController
  authorize_resource
  before_action :auth_user, :load_cart

  def show
    render json: full_cart_in_json
  end

  #Добавление продукта в корзину
  def update
    product = Product.find(params[:product_id])
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
    render json: full_cart_in_json
  end
  
  #Удаления продукта из корзины
  def destroy
    product = Product.find(params[:product_id])
    if @cart.products.include?(product)
      carts_product = @cart.carts_products.find_by(product: product)
      if carts_product.quantity > 1
        carts_product.quantity -= 1 
        carts_product.save
      else
        @cart.products.delete(product)
      end
    else
      render json: {error: "This product does not exist in you cart."}, status: :bad_request
      return
    end
    @cart.quantity -= 1
    @cart.value -= product.price
    @cart.save
    render json: full_cart_in_json
  end

  def delivery
    delivery = Delivery.find(params[:delivery_id])
    @cart.value -= @cart.delivery.price
    @cart.delivery = delivery
    @cart.value += delivery.price
    @cart.save
    render json: full_cart_in_json
  end


  protected

  def load_cart
    @cart = current_customer.cart
  end

  def full_cart_in_json
    @cart.to_json(except: :delivery_id,
                      include: { 
                      delivery:{only: %i[id name price]},
                      carts_products: { only: %i[quantity],
                        include:{
                          product:{}
                        }},
                    })  
  end
  
end
