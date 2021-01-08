class BuyRecordsController < ApplicationController
  
  before_action :authenticate_user!

  def index
    @buy_destination = BuyDestination.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    if @item.buy_record.present?
      redirect_to root_path
    end
    
  end

  def create
    @buy_destination = BuyDestination.new(buy_params)
    if @buy_destination.valid?
      pay_item
      @buy_destination.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def buy_params
    item = Item.find(params[:item_id])
    params.require(:buy_destination).permit(:cord, :prefecture_id, :address1, :address2, :building, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token], price: item.price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: buy_params[:price],
        card: buy_params[:token],
        currency: 'jpy'
      )
  end
end


