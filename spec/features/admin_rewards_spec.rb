require 'rails_helper'

RSpec.describe "Admin spec CRUD" do


  context "when logged in as an admin" do

  before(:each) do

    admin = User.create(first_name: "Richard",
                        last_name: "Mejia",
                        username: "lilrich",
                        password: "password",
                        role: 1)

    visit admin_login_path
    fill_in "session[username]", with: admin.username
    fill_in "session[password]", with: admin.password
    click_button "Login"
  end

    let(:reward) { Reward.new(
    name: "Coffee",
    description: "A nice dark-roast blend from the forests of Indodenmalarky",
    cost: 15
    )}
    it "can create new rewards" do
      visit new_admin_reward_path
      fill_in "reward[name]", with: reward.name
      fill_in "reward[description]", with: reward.description
      fill_in "reward[cost]", with: reward.cost
      click_button "Create"

      expect(current_path).to eq(admin_rewards_path)
      expect(page).to have_content(reward.name)
      expect(page).to have_content(reward.description)
      expect(page).to have_content(reward.cost)
    end

    it "can edit rewards" do
      visit new_admin_reward_path
      fill_in "reward[name]", with: reward.name
      fill_in "reward[description]", with: reward.description
      fill_in "reward[cost]", with: reward.cost
      click_button "Create"

      first(:link, "Edit").click

      fill_in "reward[name]", with: "EditedCoffee"
      fill_in "reward[description]", with: "EditedDescription"
      fill_in "reward[cost]", with: 55
      click_button "Create"

      expect(current_path).to eq(admin_rewards_path)
      expect(page).to have_content("EditedCoffee")
      expect(page).to have_content("EditedDescription")
      expect(page).to have_content(55)
    end

    it "can destroy a reward" do
      visit new_admin_reward_path
      fill_in "reward[name]", with: reward.name
      fill_in "reward[description]", with: reward.description
      fill_in "reward[cost]", with: reward.cost
      click_button "Create"

      first(:link, "Delete").click

      expect(current_path).to eq(admin_rewards_path)
      expect(page).not_to have_content(reward.name)
      expect(page).not_to have_content(reward.description)
      expect(page).not_to have_content(reward.cost)
    end
  end

  context "when logged in as default_user" do
    it "can not access admin pages" do
      visit new_admin_reward_path

      expect(page).to have_content("404Page Not Found")

      visit admin_rewards_path

      expect(page).to have_content("404Page Not Found")
    end
  end
end
