class CartsController < ApplicationController
  before_filter :authenticate_user!
  def addtocart
  @carts = Cart.create(:user_id => current_user.id, :product_id => params[:id]) 
  end
  def destroy
    Cart.find(params[:id]).delete
    redirect_to show_cart_product_orders_url
  end
end
