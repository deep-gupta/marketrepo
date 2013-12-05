class ShopsController < ApplicationController
  before_filter :authenticate_user!, except: [:search_result]
  
  def new
    if current_user.user_type != '2'
      redirect_to users_url
    end
  end
  
  def create
    if params[:commit] == "Submit"
      @shop = Shop.new(params[:shop])
      @shop.mall_id = params[:mall][:mall_id]
      @shop.user_id = current_user.id
      @shop.save
    else
      redirect_to users_url
    end
  end

  def show
    if current_user.user_type == '2'
      @shop = Shop.find(params[:id])
    end
  end
  
  def showmall
    @mall = Mall.where(:city_id => params[:id])
    render :partial => 'showmall'
  end
  
  def search_result
    #if params[:page] == 
      #@products = Product.where("name like ?", "%#{params[:search][:search]}%" and :shop_id => params[:shop_id] ).paginate(:page => 1, :per_page => 5)
    #else
      @products = Product.where("name like ?", "%#{params[:search][:search]}%").paginate(:page => params[:page], :per_page => 8)
    #end
    #end  
  end
end
