class ItemsController < ApplicationController
  before_action :assign_item, only: [ :new, :destroy ]

  def create
    @item = Item.new(create_params)
    if @item.save
      respond_to do |format|
        format.html { redirect_to items_path }
        format.json { render json: @item }
      end
    else
      render json: { error: @item.errors }, status: :unprocessable_entity
    end
  end

  def index
    @items = if params[:filter] == "archived"
       Item.staleness.archived
    else
      Item.freshness
    end.page(params[:page])
  end

  def destroy
    if @item.archive
      respond_to do |format|
        format.html { redirect_to items_path }
        format.json { render json: @item }
      end
    else
      render json: { error: @item.errors }, status: :unprocessable_entity
    end
  end

  private
  def create_params
    params.require(:item).permit(:expired_at, :name)
  end

  def assign_item
    @item = params[:id].present? ? Item.find(params[:id]) : Item.new
  end
end
