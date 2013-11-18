class CartsController < ApplicationController
	def addtocart
	@carts = Cart.create(:user_id => current_user.id, :product_id => params[:id])	
	end
	def destroy
		@cart = Cart.find(params[:id])
		@cart.delete
		redirect_to show_cart_product_orders_url
	end
end
