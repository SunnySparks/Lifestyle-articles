class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:name])

    if @user
      session[:user_id] = @user.id
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong, make sure your username is correct'
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
