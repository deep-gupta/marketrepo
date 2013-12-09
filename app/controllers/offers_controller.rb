class OffersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def new
  #shopkeeper
    @offer = Shop.find(params[:shop_id]).offers.new
  end
  
  def create
  #shopkeeper
    @offer = Offer.new(params[:offer])
    @offer.category_id = params[:category]
    @offer.save
    redirect_to shop_products_path(params[:shop_id])
  end
end
