class OffersController < ApplicationController
  before_filter :authenticate_user!
  def index
    
  end
  def new
    
    @offer = Shop.find(params[:shop_id]).offers.new
    #@category = Category.all
    
  end
  def create
  if params[:commit] == "Submit"
    @offer = Offer.new(params[:offer])
    @offer.category_id = params[:category]
    @offer.save
  else
    redirect_to shop_path(params[:shop_id])
  end  
    
  end
end
