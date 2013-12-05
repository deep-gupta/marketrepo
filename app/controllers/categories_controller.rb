class CategoriesController < ApplicationController
  before_filter :authenticate_user!, except: [:show_product]
  
  def index
    if current_user.user_type != nil
      redirect_to users_url
    end
  end
  
  def create
    if params[:commit] == "Submit"
      c=Category.create(name: params[:category][:name])
      c.save
      redirect_to users_path, :flash => {:notice => "Category successfully cfreated"}
    else
      redirect_to users_path, :flash => {:notice => "Cancle creation"}
    end  
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
    if params[:page] == nil
      @products = Category.find(params[:id]).products.paginate(:page => 1, :per_page => 6)
    else
      @products = Category.find(params[:id]).products.paginate(:page => params[:page], :per_page => 6)
    end
  end
end
