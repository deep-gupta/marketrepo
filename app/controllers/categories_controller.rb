class CategoriesController < ApplicationController
  before_filter :authenticate_user!, except: [:show_product]
  load_and_authorize_resource
  
  PER_PAGE = 6
  
  def index
    # admin
    @category = Category.all
  end
  
  def new
    # admin
    @category = Category.new
  end
  
  def create
    # admin  
    @category = Category.create(name: params[:category][:name])
    if @category.save
      redirect_to users_path, :flash => {:notice => "Category successfully created"}
    else
      render 'new'
    end  
  end

  def choose_categories
    # visitors
    @category = Category.all
  end

  def save_categories
    #visitors
    @category = UserCategory.where(:user_id => current_user.id)
    @category.delete_all
    
    params[:name_ids].each do |name|
      UserCategory.create(category_id: name, user_id: current_user.id).save
    end
    redirect_to users_path
  end
  
  def show_product
    #admin
    page = params[:page].present? ? params[:page] : 1
    @products = Category.find(params[:id]).products.paginate(:page => page, :per_page => PER_PAGE)
  end
end
