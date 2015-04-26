class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Created a PointBox Account"
      redirect_to user_path
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  def show
    current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      flash[:notice] = "Profile Updated"
      redirect_to current_user
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      render :edit
    end
  end


  private

  def user_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :username,
                                 :password,
                                 :password_confirmation,
                                 :profile_picture)
  end
end
