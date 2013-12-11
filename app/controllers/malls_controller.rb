class MallsController < ApplicationController
  before_filter :authenticate_user!
  authorize_resource 
  
  def index
    # Admin
    @malls = Mall.all
  end

  def new
    # Admin
    @mall = Mall.new
  end
  
  def create
    # Admin
    @mall = Mall.new(params[:mall])
    @mall.city_id = params[:city][:city_id].to_i
    @mall.save
    
    if @mall.save
      redirect_to users_path, :flash => {:notice => "Mall successfully created"}
    else
      render 'new'
    end
  end
  
  def show_state
    # admin ,shopkeepers
    @states = State.where(:country_id => params[:id])
    render :partial => 'show_state'
  end
  
  def show_city
    # admin ,shopkeepers
    @cities = City.where(:state_id => params[:id])
    render :partial => 'show_city'
  end
end
