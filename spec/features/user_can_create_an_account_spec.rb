require 'rails_helper'

RSpec.describe "user can create an account" do
  context "with valid credentials" do
    let!(:user) {User.new(
      first_name: "Jon",
      last_name: "Doe",
      username: "JD",
      role: 0,
      password: "password",
      password_confirmation: "password"
      )}

    it "fills in valid credentials and successfully creates an account" do
      visit new_user_path
      fill_in ("user[first_name]"), with: user.first_name
      fill_in ("user[last_name]"), with: user.last_name
      fill_in ("user[username]"), with: user.username
      fill_in ("user[password]"), with: user.password
      fill_in ("user[password_confirmation]"), with: user.password_confirmation
      click_button ("Submit")

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome, JD")
    end
  end
end
