class ProductsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    if params[:page] == nil
      @products = Product.where(:shop_id => params[:shop_id]).paginate(:page => 1, :per_page => 6)
    else
      @products = Product.where(:shop_id => params[:shop_id]).paginate(:page => params[:page], :per_page => 6)
    end
  end
  
  def new
    if current_user.user_type == '2'
      @product = Product.new
      @pictures = 1.times{ @product.pictures.build }
    end  
  end

  def create
    if params[:commit] == "Submit"
      @product = Product.create(params[:product])
      @product.save
      redirect_to shop_products_url(params[:shop_id])
    else
      redirect_to shop_products_url(params[:shop_id])
    end
  end
  
  def show
    @product = Product.find(params[:id])
  end
end
