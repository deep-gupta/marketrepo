class OrdersController < ApplicationController
  before_filter :authenticate_user!
  def show_cart_product
    @carts = Cart.where(:user_id => current_user.id)
  end

  def new
    #@order = User.find(current_user.id).orders.new
  end

  def create
    @order =User.find(current_user.id).orders.create(params[:order])
    
    @carts = Cart.where(:user_id => current_user.id)
    @carts.each do |c|
    @orderdetail = @order.order_details.create(:product_name => c.product.name)
    end
    @carts.delete_all   
  end

  def place_order

  end
end
