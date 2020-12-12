class DeliveriesController < APIBaseController
  authorize_resource except: %i[index show]
  before_action :auth_user, except: %i[index show]

  def index
    deliveries = Delivery.all.order(:id)
    if deliveries.empty?
      render status: 204
    else
      render json: deliveries
    end
  end

  def show
    @delivery = Delivery.find(params[:id])
    if @delivery.errors.blank?
      render json: @delivery, status: :ok
    else
      render json: @delivery.errors, status: :bad_request
    end
  end

  def update
    @delivery = Delivery.find(params[:id]).update(update_delivery_params)
    if @delivery.errors.blank?
      render json: @delivery, status: :ok
    else
      render json: @delivery.errors, status: :bad_request
    end
  end

  def create
    @delivery = Delivery.create(create_delivery_params)
    if @delivery.errors.blank?
      render json: @delivery, status: :ok
    else
      render json: @delivery.errors, status: :bad_request
    end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    if @delivery.errors.blank?
      @delivery.destroy
      render status: :ok
    else
      render json: @delivery.errors, status: :bad_request
    end
  end

  protected

  def default_delivery_fields
    %i[ price ]
  end

  def update_delivery_params
    params.required(:delivery).permit(
      *default_delivery_fields
    )
  end

  def create_delivery_params
    params.required(:delivery).permit(
      *default_delivery_fields
    )
  end
end
