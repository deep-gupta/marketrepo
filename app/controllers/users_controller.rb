class UsersController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  PER_PAGE = 6
  
  def index
  end
  
  def edit
    # visitors, shopkeeper
    @user = User.find(current_user.id) 
    @pictures = 1.times{ @user.pictures.build }
  end

  def update
    # visitors shopkeeper
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    @user.save
    redirect_to users_path
  end
  
  def destroy
    #admin
    @user = User.find(params[:id])
    @user.destroy
    redirect_to displayallusers_users_path, :flash => {:notice => "Display all users"}
  end
  
  def display_all_users
  #admin
    @users = User.all
  end

  def confirm_pending
  #admin
    # convert it into scope: User.where("user_type = ? and status_of_shopkeeper = ?","2","pending") 
    if current_user.user_type == 'admin'
      @users = User.where("user_type = ? and status_of_shopkeeper = ?","2","pending") 
    else
      redirect_to users_path
    end  
  end

  def pending
    #admin
    @user = User.where(:id => params[:id]).first
    @user.update_attributes(:status_of_shopkeeper,'confirm')
    redirect_to confirm_pending_users_path
  end
  
  def showproduct
    page = params[:page].present? ? params[:page] : 1  
    @products = Product.where("name like ?", "%#{params[:search][:search]}%").paginate(:page => page, :per_page => PER_PAGE)
  end
end
