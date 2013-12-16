class OffersController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource
  
  def index
    @offers = current_user.shops.find(params[:shop_id]).offers
  end
  
  def new
    #shopkeeper
    @shop = current_user.shops.where(:id => params[:shop_id]).first
    if @shop.present?
      @offer = @shop.offers.new
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
      #mail for generating offer
      OfferMailer.offer_create(@offer).deliver
      @user_categories = @offer.category.user_categories
      # mail to related users
      @user_categories.each do |uc| 
        OfferMailer.mail_to_users(uc,@offer).deliver
      end
      redirect_to shop_products_path(params[:shop_id]), :flash => {:notice => "Offer successfully created"}
    else
      render 'new'
    end
  end
  
  def edit
    @offer = Offer.find(params[:id])
  end
  
  def update
    @offer = Offer.find(params[:id])
    @offer.update_attributes(params[:offer])
    
    redirect_to shop_offers_path(params[:shop_id]), :flash => {:notice => "Offer successfuly updated"}
  end
  
  def destroy
    Offer.find(params[:id]).destroy
    redirect_to shop_offers_path(params[:shop_id]), :flash => {:notice => "Offer successfuly deleted"}  
  end
end
