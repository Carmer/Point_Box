class Admin::UsersController < Admin::BaseController

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
    if params[:option] == "add_points"
      render :edit_points
    else
      render :edit
    end
  end

  def update
    @user = User.find(params[:id])
    new_points = users_params[:points].to_i + @user.points
    if users_params[:points] != @user.points
      if @user.update(points: new_points)
        redirect_to admin_user_path(@user)
      else
        flash[:error] = "Did Not Save Updates!!"
        render :admin_users_path
      end
    else
      if @user.update(users_params)
        redirect_to admin_user_path(@user)
      else
        flash[:error] = "Did Not Save Updates!!"
        render :admin_users_path
      end
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def users_params
    params.require(:user).permit(:first_name,
                                 :last_name,
                                 :username,
                                 :points,
                                 :password,
                                 :profile_picture)
  end
end
