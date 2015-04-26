require 'rails_helper'

RSpec.describe "user rewards" do
  context "default user" do

    let!(:reward1) {
      Reward.create(name: "Reward1",
                    description: "Description of Reward1",
                    cost: 5)
                  }

    let!(:reward2) {
      Reward.create(name: "Reward2",
                    description: "Description of Reward2",
                    cost: 5)
                  }

    let!(:reward3) {
      Reward.create(name: "Reward3",
                    description: "Description of Reward3",
                    cost: 5)
                  }

    let(:user) {
      User.create(first_name: "Andrew",
                        last_name: "Carmer",
                        username: "ajc",
                        password: "password"
                        )
                  }



    it "can see all rewards" do
      visit login_path
      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: user.password
      click_button "Login"

      click_link("View All Available Rewards")

      expect(page).to have_content(reward1.name)
      expect(page).to have_content(reward2.description)
      expect(page).to have_content(reward1.cost)
      expect(page).to have_content(reward3.name)
      expect(page).to have_content(reward3.description)
      expect(page).to have_content(reward3.cost)
    end

    it "can redeem a reward and subtract points" do
      visit login_path
      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: user.password
      click_button "Login"

      expect(page).to have_content("10 points")

      click_link("View All Available Rewards")

      first(:button, "Redeem Reward").click


      expect(user.rewards.first.name).to eq(reward1.name)
      expect(current_path).to eq(user_path(user))
      expect(page).to have_content(reward1.name)
      expect(page).to have_content("5 points")
    end
  end
end
