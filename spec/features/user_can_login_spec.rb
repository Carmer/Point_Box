require 'rails_helper'

RSpec.describe "user login" do
  context "with valid credentials" do
    it "logs in" do
      user = User.create(first_name: "Andrew", last_name: "Carmer", username: "ajcarmer", password: "password")

      visit login_path
      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: user.password
      click_button "Login"

      expect(page).to have_content("Welcome, ajcarmer")
    end
  end

  context "with invalid credentials" do

    it "tries to login with invalid username" do
      user = User.create(first_name: "Andrew", last_name: "Carmer", username: "ajcarmer", password: "password")

      visit login_path
      fill_in "session[username]", with: "ajjjcarmer"
      fill_in "session[password]", with: user.password

      expect(current_path).not_to have_content("Welcome, ajjjcarmer")
    end
  end
end
