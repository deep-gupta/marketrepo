class ProductsController < ApplicationController
  def index
    @products = Product.where(:shop_id => params[:shop_id])
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
    
  end
end
