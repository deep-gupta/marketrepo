class MallsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  def index
    @malls = Mall.all
  end

  def new
    @mall = Mall.new
  end
  
  def create
    @mall = Mall.new(params[:mall])
    @mall.city_id = params[:city][:city_id].to_i
    @mall.save
    if @mall.save
      redirect_to users_path, :flash => {:notice => "Successfully created"}
    else
      render 'new'
    end
  end
  
  def show_state
    @states = State.where(:country_id => params[:id])
    render :partial => 'show_state'
  end
  
  def show_city
    @cities = City.where(:state_id => params[:id])
    render :partial => 'show_city'
  end
end
