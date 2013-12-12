class CategoriesController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource
  
  PER_PAGE = 6
  
  def index
    # admin
    @categories = Category.all
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
    @categories = Category.all
  end

  def save_categories
    #visitors
    @user_categories = current_user.user_categories
    #@user_categories.delete_all
    
    params[:name_ids].each do |name|
      begin
        current_user.user_categories.create(category_id: name)
        #raise 'a test exception'
      rescue Exception => e
        puts "Error occours"
        redirect_to users_path, :flash => {:notice => "Error occour"} and return
      end 
    end
    @user_categories.delete_all
    redirect_to users_path, :flash => {:notice => "Category successfully Added to your profile"}
  end
  
  def show_product
    #admin
    @products = Category.where(:id => params[:id]).first.products.paginate(:page => params[:page], :per_page => PER_PAGE)
  end
end
