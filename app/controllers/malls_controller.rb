class MallsController < ApplicationController
  before_filter :authenticate_user!
  
  def index
    @mall = Mall.all
  end

  def new
  end
  
  def create
    if params[:commit] == "Submit"
      if current_user.user_type == nil
        @tmall = Mall.where(name: params[:mall][:name])
        if @tmall.present?
          render text: "already exist "
          return
          render 'new'
        else
          @mall = Mall.new(params[:mall])
          @mall.city_id = params[:city][:city_id].to_i
          @mall.save
        end
      end  
        redirect_to users_path, :flash => {:notice => "Successfully cfreated"}
    
    else
      
      redirect_to users_path, :flash => {:notice => "Cancle creation"}    
    end  
  end
  
  def showstate
    @states = State.where(:country_id => params[:id])
    render :partial => 'showstate'
  end
  
  def showcity
    @cities = City.where(:state_id => params[:id])
    render :partial => 'showcity'
  end
end
