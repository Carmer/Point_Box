require "rails_helper"

RSpec.describe "user can logout" do
  context "when user is logged it" do
    it "can logout" do
      user = User.create(first_name: "Andrew", last_name: "Carmer", username: "ajcarmer", password: "password")

      visit login_path
      fill_in "session[username]", with: user.username
      fill_in "session[password]", with: user.password
      click_button "Login"

      click_link "Logout"
      expect(page).to have_content("Goodbye!")
    end
  end
end
