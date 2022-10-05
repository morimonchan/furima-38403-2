class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @purchase_history_sent = PurchaseHistorySent.new
    @item = Item.find(params[:item_id])
  end
  

  def create
    @item = Item.find(params[:item_id])
    @purchase_history_sent = PurchaseHistorySent.new(purchase_history_params)
    if @purchase_history_sent.valid?
      @purchase_history_sent.save
      redirect_to root_path
    else 
      render "index"
    end
  end

  private
  

  def purchase_history_params
    params.require(:purchase_history_sent).
    permit(:code, :place_id, :city, :street_address, :building, :phone_number, :purchase_history_id).
    merge(user_id: current_user.id, item_id: params[:item_id])

  end


end
