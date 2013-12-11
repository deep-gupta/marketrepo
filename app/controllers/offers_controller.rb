class OffersController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource
  
  def new
    #shopkeeper
    @shop = current_user.shops.where(:id => params[:shop_id]).first
    if @shop.present?
      @shop.offers.new
    else
      redirect_to users_path, :flash => {:notice => "access denied"} 
    end  
  end
  
  def create
    #shopkeeper
    @offer = Offer.new(params[:offer])
    @offer.category_id = params[:category]
    @offer.save
    
    if @offer.save
      redirect_to shop_products_path(params[:shop_id]), :flash => {:notice => "Offer successfully created"}
    else
      render 'new'
    end
  end
end
