class SessionsController < ApplicationController
  def create
    @user = User.find_by(name: params[:name])

    if !!@user && @user.authenticate(params[:name])
      session[:user_id] = @user.id
      redirect_to user_path
    else
      message = 'Something went wrong, make sure your username is correct'
      redirect_to root_path, notice: message
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
