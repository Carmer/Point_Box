require 'rails_helper'

RSpec.describe UserReward, type: :model do
  context "is valid" do
    it "is valid with all attributes" do
      user_reward = UserReward.new(user_id: 1, reward_id: 1)

      expect(user_reward).to be_valid
    end
  end
  context "is not valid" do
    it "is not valid without user_id" do
      user_reward = UserReward.new(user_id: nil, reward_id: 1)
      expect(user_reward).not_to be_valid
    end

    it "is not valid without reward_id" do
      user_reward = UserReward.new(user_id: 1, reward_id: nil)
      expect(user_reward).not_to be_valid
    end
  end
end
