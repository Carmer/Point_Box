class User::RewardsController < User::BaseController

  def new
    @user = current_user
    @rewards = Reward.all
  end

  def create
    user = current_user
    new_points = user.points - params[:reward_info][:reward_cost].to_i
    user_reward = UserReward.new(reward_id: params[:reward_info][:reward_id], user_id: current_user.id)

    if user_reward.save
     user.update(points: new_points)
     flash[:notice] = "Reward Redeemed!"
     redirect_to current_user
   else
     flash[:error] = "Not Redeemed!"
     render :new
   end
  end

end
