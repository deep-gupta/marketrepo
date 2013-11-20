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
    @user = User.find(params[:id])
    @user.update_attributes(params[:user])
    redirect_to users_url
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
    #Model.where("column = ? or other_column = ?", value, other_value)
  end

  def pending
    @user = User.where(:id => params[:id]).first
    @user.update_column(:status_of_shopkeeper,'confirm')
    redirect_to confirm_pending_users_url
  end
  def showproduct
    @products = Category.find(params[:id]).products

    render :partial => 'showproduct'
    end
 
end
