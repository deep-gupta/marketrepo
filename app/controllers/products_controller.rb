class ProductsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  PER_PAGE = 6
  
  def index
    page = params[:page].present? ? params[:page] : 1
    @products = Product.where(:shop_id => params[:shop_id]).paginate(:page => page, :per_page => PER_PAGE)
  end
  
  def new
    #shopkeeper
    @product = Product.new
    @pictures = 1.times{ @product.pictures.build }
  end

  def create
    #shopkeeper
    @product = Product.create(params[:product])
    @product.save
    redirect_to shop_products_path(params[:shop_id])
  end
  
  def show
    @product = Product.find(params[:id])
  end
end
