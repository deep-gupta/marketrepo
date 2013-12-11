class UsersController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource
  
  PER_PAGE = 6
  
  def index
  end
  
  def edit
    # visitors, shopkeeper
    @user = current_user 
    @pictures =  @user.pictures.build 
  end

  def update
    # visitors shopkeeper
    @user = current_user
    @user.update_attributes(params[:user])
    if @user.save
      redirect_to users_path, :flash => {:notice => "Edit profile successfully"}
    else
      render 'edit'
    end
  end
  
  def destroy
    #admin
    User.find(params[:id]).destroy
    redirect_to display_all_users_users_path, :flash => {:notice => "User deleted successfully"}
  end
  
  def display_all_users
    #admin
    @users = User.all
  end

  def confirm_pending
    #admin scope(pending_request)
    @users = User.pending_request
  end

  def pending
    #admin
    @user = User.where(:id => params[:id]).first
    @user.update_column(:status_of_shopkeeper,'confirm')
    redirect_to confirm_pending_users_path, :flash => {:notice => "Confirm request"}
  end
  
  def show_products
    #visitors
    @products = Product.where("name like ?", "%#{params[:search][:search]}%").paginate(:page => params[:page], :per_page => PER_PAGE)
  end
end
