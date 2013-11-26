class ShopsController < ApplicationController
  before_filter :authenticate_user!, except: [:search_result]
  def index

  end
  def new
    #if current_user.status_of_shopkeeper == 'confirm'
    # render text: "not created"
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
  def search_result
    
    #if params[:page] == nil
     # @product = Product.all.paginate(:page => 1, :per_page => 10)
    #else
     # @product = Product.all.paginate(:page => params[:page], :per_page => 10)
    #end
  end
  
end
