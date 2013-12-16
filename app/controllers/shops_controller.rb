class ShopsController < ApplicationController
  before_filter :authenticate_user!, except: [:search_result]
  authorize_resource
  skip_authorize_resource :only => :search_result
  
  PER_PAGE = 8
  
  def index
    @shops = current_user.shops
  end
  
  def new
    #shopkeeper
    if current_user.status_of_shopkeeper == "confirm"
      @shop = Shop.new
    else
      redirect_to users_path, :flash => {:notice => "To create shop admin permission needed"}
    end
  end
  
  def create
    #shopkeeper
    @shop = current_user.shops.create(params[:shop])
    @shop.mall_id = params[:mall][:mall_id]
    if @shop.save
      redirect_to users_path, :flash => {:notice => "Shop created successfully"}
    else
      render 'new'
    end
  end
  
  def edit
  
    @shop = current_user.shops.where(:id => params[:id]).first
    if @shop.blank?
     redirect_to shops_path, :flash => {:notice => "Unauthorized Access"}
    end
  end
  
  def update
    @shop = current_user.shops.where(:id => params[:id]).first
    @shop.update_attributes(params[:shop])
    @shop.mall_id = params[:mall][:mall_id]
    
    if @shop.save
      redirect_to shops_path
    else
      redirect_to users_path, :flash => {:notice => "error occour"}
    end
  
  end
  
  def destroy
    @shop = current_user.shops.where(:id => params[:id]).first
    @shop.delete
    redirect_to shops_path
    
  end

  def show_mall
    # Admin ,Shopkeepers
    @mall = Mall.where(:city_id => params[:id])
    render :partial => 'show_mall'
  end
  
  def search_result
    @products = Product.where("name like ?", "%#{params[:search][:search]}%").paginate(:page => params[:page], :per_page => PER_PAGE)
  end
end

