class Api::ItemsController < Api::BaseController
  before_action :doorkeeper_authorize!
  before_action :set_item, only: [:show, :update, :destroy]

  def index
    @items = Item.all
    respond_with @items
  end

  def show
    respond_with @item
  end

  def create
    @item = Item.create(item_params)
    respond_with @item
  end

  def update
    @item.update_attributes(item_params)
    respond_with @item
  end

  def destroy
    @item.destroy
    respond_with @item
  end

  private 

  def item_params
    params.require(:item).permit(:name, :description)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
