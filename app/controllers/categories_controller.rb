class CategoriesController < ApplicationController
  before_filter :authenticate_user!, except: [:show_product]
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
    @category = UserCategory.where(:user_id => current_user.id)
    @category.delete_all
    
      params[:name_ids].each do |name|
        UserCategory.create(category_id: name, user_id: current_user.id).save
      end
  end
  def show_product
  
    @product = Category.find(params[:id]).products
  
  end
end
