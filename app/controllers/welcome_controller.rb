
class WelcomeController < ApplicationController
 before_filter :authenticate_user!
  def index
  redirect_to new_user_session_path
  end
  
end
