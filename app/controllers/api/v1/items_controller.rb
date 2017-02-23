class Api::V1::ItemsController < ApplicationController
  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def destroy
    render json: Item.destroy(params[:id])
  end

  def create
    @new_item = Item.create(item_params)
    render json: @new_item
  end

  private

  def item_params
    params.require(:item).permit(:name, :description, :image_url)
  end
end