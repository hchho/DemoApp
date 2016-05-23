class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  helper_method :current_user

  # def current_user
  # 	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  #   rescue ActiveRecord::RecordNotFound
  # end

  def require_user
    unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
    end
  end

  def require_admin
    redirect_to '/' unless current_user.admin?
  end
  
end
