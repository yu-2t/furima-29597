class ItemsController < ApplicationController 
  before_action :set_item, only:[:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only:[:new, :edit, :destroy]
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
      @item.destroy
    end
  end

  
  private

  def item_params
    params.require(:item).permit(:name,:text,:price,:image, :category_id, :condition_id, :fee_id, :prefecture_id, :schedule_id,).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
