class SessionsController < ApplicationController

  def new
  end

  def create
    # @user = User.find_or_create_by_auth(request.env['omniauth.auth'])
    @user = User.find_by(username: params[:session]['username'])
    if @user.admin? && @user && @user.authenticate(params[:session][:password])
        flash[:notice] = "Hello Admin, #{@user.username}. You are now logged in."
        session[:user_id] = @user.id
        redirect_to admin_path
    elsif @user && @user.authenticate(params[:session][:password])
      flash[:notice] = "You are now logged in as #{@user.username}"
      session[:user_id] = @user.id
      redirect_to user_path
    else
      flash[:errors] = "Invalid Credentials!"
      redirect_to login_path
    end
  end

  def destroy
    session.clear
    render :goodbye
  end
end
