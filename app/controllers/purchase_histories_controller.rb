class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]


  def index
    @purchase_history_sent = PurchaseHistorySent.new
    redirect_to root_path if current_user == @item.user || @item.purchase_history.present?
  end

  def create
    @purchase_history_sent = PurchaseHistorySent.new(purchase_history_params)
    if @purchase_history_sent.valid?
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: params[:token],
        currency: 'jpy'
      )
      @purchase_history_sent.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_history_params
    params.require(:purchase_history_sent)
          .permit(:code, :place_id, :city, :street_address, :building, :phone_number, :purchase_history_id)
          .merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    binding.pry
    @item = Item.find(params[:item_id])
  end

end
