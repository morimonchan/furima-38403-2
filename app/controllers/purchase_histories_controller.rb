class PurchaseHistoriesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
  end

  private
  # def sent_params
  # params.require(:sent).permit(:code, :place_id, :city, :street_address, :buiding, :phone_number).merge(user_id: current_user.id)
  # end

end


