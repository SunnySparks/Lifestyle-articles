class ApplicationController < ActionController::Base
  def current_user
    if session[:user_id]
      @current_user = User.find(session[:user_id])
      @current_user
    else
      false
    end
  end

  helper_method :current_user

  def require_user
    unless current_user
      flash[:notice] = 'You must be logged in to access this page'
      redirect_to new_user_path
      false
    end
  end

  helper_method :current_user
end
