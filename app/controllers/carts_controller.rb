class CartsController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource
  
  def index
    #visitors
    @carts = current_user.carts 
  end
  
  def add_to_cart
    # visitors
    @cart = current_user.carts.create(:product_id => params[:id])
    render :text => 'added successfully'
  end
  
  def destroy
    #visitors
    @cart = current_user.carts.where(:id => params[:id])
    if @cart.present?
      @cart.delete_all
      redirect_to carts_path,  :flash => {:notice => "1 item removed"}
    else
      redirect_to carts_path, :flash => {:notice => "access denied"}
    end
  end
end
