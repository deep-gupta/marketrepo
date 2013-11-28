class ProductsController < ApplicationController
before_filter :authenticate_user!
  def index
  
      if params[:page] == nil
        @products = Product.where(:shop_id => params[:shop_id]).paginate(:page => 1, :per_page => 8)
      else
        @products = Product.where(:shop_id => params[:shop_id]).paginate(:page => params[:page], :per_page => 8)
      end
  
  end
  
  def new
    @product = Product.new
    @pictures = 1.times{ @product.pictures.build }
    @category = Category.all
  end

  def create
    
    @product = Product.create(params[:product])
    @product.save
  end
  
  def show
      @product = Product.find(params[:id])
  end
end
