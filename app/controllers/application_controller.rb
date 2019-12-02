class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    unless session[:user_id].nil?
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def require_login
    if current_user.nil?
      flash[:error] = "You must be logged in!"
      redirect_to login_path
      puts "Not logged in!"
    end
  end
end
