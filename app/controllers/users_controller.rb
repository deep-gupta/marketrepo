class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
  end
  
  def new
  end 
  
  def edit
    @user= User.find(current_user.id) 
    @pictures = 1.times{ @user.pictures.build }
  end

  def update
  if params[:commit] == "Edit"
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    @user.save
    redirect_to users_url
  else
    redirect_to users_url
  end  
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render 'displayallusers'
  end
  

  def displayallusers
    @users = User.all
  end

  def confirm_pending
    @users = User.where("user_type = ? and status_of_shopkeeper = ?","2","pending") 
  end

  def pending
    @user = User.where(:id => params[:id]).first
    @user.update_column(:status_of_shopkeeper,'confirm')
    redirect_to confirm_pending_users_url
  end
  def showproduct
      
      if params[:page] == nil
        @products = Product.where("name like ?", "%#{params[:search][:search]}%").paginate(:page => 1, :per_page => 6)
      else
        @products = Product.where("name like ?", "%#{params[:search][:search]}%").paginate(:page => params[:page], :per_page => 6)
      end
    end
 end
