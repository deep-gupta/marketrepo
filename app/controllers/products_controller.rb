class ProductsController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource
  
  PER_PAGE = 6
  
  def index
    @shop = current_user.shops.where(:id => params[:shop_id]).first
    if @shop.present?
      @products = @shop.products.paginate(:page => params[:page], :per_page => PER_PAGE)
    else
      redirect_to users_path, :flash => {:notice => "access denied"}#shop_products_path(params[:shop_id]) 
    end  
  end
  
  def new
    #shopkeeper
    @shop = current_user.shops.where(:id => params[:shop_id]).first
    if @shop.present?
      @product = Product.new
      @pictures =  @product.pictures.build 
    else
      redirect_to users_path, :flash => {:notice => "access denied"}
    end  
  end

  def create
    #shopkeeper
    @product = Product.create(params[:product])
    if @product.save
      redirect_to shop_products_path(params[:shop_id]), :flash => {:notice => "Product successfully created"}
    else
      render 'new'
    end  
  end
  
  def show
    @product = Product.find(params[:id])
  end
end
