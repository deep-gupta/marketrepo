class OffersController < ApplicationController
  before_filter :authenticate_user!
  def index
    
  end
  def new
    
    @offer = Shop.find(params[:shop_id]).offers.new
    #@category = Category.all
    
  end
  def create
    @offer = Offer.new(params[:offer])
    @offer.category_id = params[:category]
    @offer.save
    
    
  end
end
