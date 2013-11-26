class ProductsController < ApplicationController
before_filter :authenticate_user!
  def index
    if params[:page] == nil
      @products = Product.where(:shop_id => params[:shop_id]).paginate(:page => 1, :per_page => 5)
    else
      @products = Product.where(:shop_id => params[:shop_id]).paginate(:page => params[:page], :per_page => 5)
    end
  end
  
  def new
    @product = Product.new
    @pictures = 1.times{ @product.pictures.build }
    #@product_categories = 1.times{ @product.product_category.build}
    @category = Category.all
  end

  def create
    
    @product = Product.create(params[:product])
    #@productcategory = ProductCategory.new(:product_id => @product, :Category_id => params[:category_id])
    @product.save
  end
  
  def show
      @product = Product.find(params[:id])
  end
end
