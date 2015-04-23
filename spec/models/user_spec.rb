require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {User.new(first_name: "Jane", last_name: "Doe", username: "wwjd", password: "password" )}
  context "is valid" do
    it "id valid with all necessary fields" do
      expect(user).to be_valid
    end
  end

  context "is invalid" do
    it "is not valid without first name" do
      user.first_name = nil
      expect(user).not_to be_valid
    end

    it "is not valid without last name" do
      user.last_name = nil
      expect(user).not_to be_valid
    end

    it "is not valid without username" do
      user.username = nil
      expect(user).not_to be_valid
    end

    it "is not valid without password" do
      user.password = nil
      expect(user).not_to be_valid
    end
  end
end
