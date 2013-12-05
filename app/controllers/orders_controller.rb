class OrdersController < ApplicationController
  before_filter :authenticate_user!
  
  def show_cart_product
    @carts = Cart.where(:user_id => current_user.id)
  end

  def new
  end

  def create
    @order =User.find(current_user.id).orders.create(params[:order])
    #@carts = Cart.where(:user_id => current_user.id)
    #@carts.each do |c|
    #@orderdetail = @order.order_details.create(:product_name => c.product.name)
    #end
    #@carts.delete_all
    redirect_to  new_payment_url   
  end

  def place_order
    @carts = Cart.where(:user_id => current_user.id)
    @order = User.find(current_user).orders.last
    
    @carts.each do |c|
      @orderdetail = @order.order_details.create(:product_name => c.product.name)
    end
    
    @carts.delete_all
    render text: "order successfully placed"
  end
end
