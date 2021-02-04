class ItemsController < ApplicationController 
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:new, :edit, :destroy]
  before_action :search_item, only: [:index, :search, :show]
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
   @item = Item.new(item_params)
   if @item.save
    redirect_to root_path
   else
    render :new
   end
  end

  def show
  end

  def edit
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
      if @item.destroy
        redirect_to root_path
      else
        render :show
      end
    else
      redirect_to root_path
    end
  end

  def search
    @results = @q.result
  end
  
  private

  def item_params
    params.require(:item).permit(:name,:text,:price, :category_id, :condition_id, :fee_id, :prefecture_id, :schedule_id, images: []).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def search_item
    @q = Item.ransack(params[:q])
  end
end
