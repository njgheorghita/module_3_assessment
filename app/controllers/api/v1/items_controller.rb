class Api::V1::ItemsController < ActionController::API
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    render json: Item.destroy(params[:id]), status: 204
  end

  def create
    @new_item = Item.create(item_params)
    render json: @new_item, status: 201
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end