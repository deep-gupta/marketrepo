class ApplicationController < ActionController::Base
  before_filter :authenticate_user!
  protect_from_forgery
  
  require 'will_paginate/array'
  def after_sign_in_path_for(resource)
    users_path
  end
  def after_sign_out_path_for(resource)
    root_url

  end
end
