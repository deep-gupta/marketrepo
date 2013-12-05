class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
  end
  
  def edit
    @user = User.find(current_user.id) 
    @pictures = 1.times{ @user.pictures.build }
  end

  def update
  
    if params[:commit] == "Edit"
      @user = User.find(params[:id])
      @user.update_attributes(params[:user])
      @user.save
      redirect_to users_path(:test=>"dsfdsf")
    else
      redirect_to users_path
    end  
  end


  def destroy
    if current_user.user_type == nil
      @user = User.find(params[:id])
      @user.destroy
      redirect_to displayallusers_users_path, :flash => {:notice => "Display all users"}
    else
      redirect_to users_path
    end  
  end
  

  def displayallusers
    if current_user.user_type == nil
      @users = User.all
    else
      redirect_to users_path
    end  
  end

  def confirm_pending
    if current_user.user_type == nil
      @users = User.where("user_type = ? and status_of_shopkeeper = ?","2","pending") 
    else
      redirect_to users_path
    end  
  end

  def pending
    @user = User.where(:id => params[:id]).first
    @user.update_column(:status_of_shopkeeper,'confirm')
    redirect_to confirm_pending_users_path
  end
  
  def showproduct
    if params[:page] == nil
      @products = Product.where("name like ?", "%#{params[:search][:search]}%").paginate(:page => 1, :per_page => 6)
    else
      @products = Product.where("name like ?", "%#{params[:search][:search]}%").paginate(:page => params[:page], :per_page => 6)
    end
  end
  
  def show_cart
    if current_user.user_type == '1'
      @carts = Cart.where(:user_id => current_user.id).paginate(:page => 1, :per_page => 6)
    end  
  end
  
  def show_all_category
    if current_user.user_type == nil
      @category = Category.all
    else
      redirect_to users_url
    end  
  end
end
