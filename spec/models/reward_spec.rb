require 'rails_helper'

RSpec.describe Reward, type: :model do
  let(:reward) { Reward.new(name: "star",
                            description: "standard 5 point star",
                            cost: 15) }
  context "is valid" do
    it "is valid with valid attributes" do
      expect(reward).to be_valid
    end
  end

  context "is invalid with invalid attributes" do
    it "is invalid without name" do
      reward = Reward.new(description: "description", cost: 13)

      expect(reward).to_not be_valid
    end

    it "is invalid without description" do
      reward = Reward.new(name: "name", cost: 14)

      expect(reward).to_not be_valid
    end

    it "is invalid without cost" do
      reward = Reward.new(name: "name", description: "descript")

      expect(reward).to_not be_valid
    end
  end
end
