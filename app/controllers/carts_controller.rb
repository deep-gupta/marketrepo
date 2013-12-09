class CartsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    #visitors
    @carts = Cart.where(:user_id => current_user.id)
  end
  
  def add_to_cart
    #visitors
    @carts = Cart.create(:user_id => current_user.id, :product_id => params[:id]) 
  
  end
  
  def destroy
    #visitors
    Cart.find(params[:id]).delete
    redirect_to carts_path
  end
end
