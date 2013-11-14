class ShopsController < ApplicationController
  def index

  end
  def new
  	#if current_user.status_of_shopkeeper == 'confirm'
  	#	render text: "not created"
  	#end
  end
  
  def create
    @shop = Shop.new(params[:shop])
    @shop.mall_id = params[:mall][:mall_id]
    @shop.user_id = current_user.id
    @shop.save
  end

  def show
    @shop = Shop.find(params[:id])
    
  end
  
  def showmall
  	@mall = Mall.where(:city_id => params[:id])
  	render :partial => 'showmall'
  	
  end
end
