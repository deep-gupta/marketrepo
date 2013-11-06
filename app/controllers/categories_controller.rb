class CategoriesController < ApplicationController
	def index
		
		
	end
	def create
		c=Category.create(name: params[:category][:name])
		c.save
		render 'index'
	end

	def choosecategories
		@category = Category.all
		
	end
	def savecategories
	
		params[:name_ids].each do |name|

			c=UserCategory.create(category_id: name, user_id: current_user.id)
			c.save
			
		end
	
		
	end
end
