class OrdersController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource
  
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
    @cart_products = Cart.where(:user_id => current_user.id)
    @order = User.find(current_user).orders.last
    
    @cart_products.each do |cp|
      @orderdetail = @order.order_details.create(:product_name => cp.product.name)
    end
    
    @cart_products.delete_all
    render text: "order successfully placed"
  end
end
