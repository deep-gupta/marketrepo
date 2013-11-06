class UsersController < ApplicationController
	before_filter :authenticate_user!

	def index

		
	end
	
	def new
		
		if current_user.user_type == '1'
			render 'visitors'
		end
		if current_user.user_type == '2'
			render 'shopkeeper'
		end
	end	
 	def edit
 	  @user= User.find(current_user.id)			
 	end
 	def update
 	
 		@user = User.find(current_user.id)
 		if @user.update_attributes(params[:user])
 	
 		else
 	
 	
 		end

 	end

 	def displayallusers
 		@users = User.all
 	end

	def visitors

	end
	def shopkeeper
		
	end
end
