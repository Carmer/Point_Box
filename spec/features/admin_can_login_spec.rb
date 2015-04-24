require 'rails_helper'

RSpec.describe "admin login" do
  context "as an Admin" do
    it "can login to admin login" do
      admin = User.create(first_name: "Richard",
                          last_name: "Mejia",
                          username: "lilrich",
                          password: "password",
                          role: 1)

      visit admin_login_path
      fill_in "session[username]", with: admin.username
      fill_in "session[password]", with: admin.password
      click_button "Login"

      expect(page).to have_content("Admin Dashboard")
    end
  end
end
