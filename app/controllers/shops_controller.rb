class ShopsController < ApplicationController
  before_filter :authenticate_user!, except: [:search_result]
  load_and_authorize_resource
  skip_authorize_resource :only => :search_result
  
  def new
    #shopkeeper
    @shop = Shop.new
  end
  
  def create
    #shopkeeper
    @shop = Shop.new(params[:shop])
    @shop.mall_id = params[:mall][:mall_id]
    @shop.user_id = current_user.id
    if @shop.save
      redirect_to users_url
    else
      render 'new'
    end
  end

  def show_mall
    @mall = Mall.where(:city_id => params[:id])
    render :partial => 'show_mall'
  end
  
  def search_result
    page = params[:page].present? ? params[:page]: 1
    @products = Product.where("name like ?", "%#{params[:search][:search]}%").paginate(:page => page, :per_page => 8)
  end
end

