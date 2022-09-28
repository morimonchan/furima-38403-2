class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index,:show]

  def index
    @items = Item.all
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

  private

  def item_params
    params.require(:item).permit(:name, :explain, :category_id, :condition_id, :cost_burden_id, :place_id, :sent_day_id, :price,
                                 :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
