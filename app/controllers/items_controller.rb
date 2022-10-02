class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path(@item.user_id)
    else
      render :new
    end
  end

  def show
    @item  = Item.find(params[:id])
  end

  def edit
    @item  = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save
      redirect_to items_path(@item.user_id)
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explain, :category_id, :condition_id, :cost_burden_id, :place_id, :sent_day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def move_to_index
    @item  = Item.find(params[:id])
    redirect_to action: :index unless user_signed_in? && current_user.id == @item.user_id
  end
end
